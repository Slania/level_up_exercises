$(function () {
    data_series = ["cumulative_data", "instantaneous_data"]
    series_colors = ["red", "blue", "green"]
    moodSeries = [];
    moodMessages = {};
    countSeries = [];
    jsonCallsCompleted = 0;
    
    createMoodChart = function() {
        $('#moodContainer').highcharts('StockChart', {
            rangeSelector: {
                inputEnabled: true    
            },
            title: {
                text: 'Mood Score'
            },
            legend: {
                enabled: true
            },
            tooltip: {
                formatter: function () {
                    return moodMessages[this.points[0].series.name.split("_")[0]][String(this.x)].join("<br/>");
                }
            },
            series: moodSeries
        });
    };

    createCountChart = function() {
        $('#countContainer').highcharts('StockChart', {
            chart: {
                type: 'column'
            },
            rangeSelector: {
                inputEnabled: true    
            },
            title: {
                text: 'Message Count'
            },
            legend: {
                enabled: true
            },
            series: countSeries
        });
    };

    updateData = function(kallbak) {
        jsonCallsCompleted = 0;
        moodSeries = [];
        countSeries = [];
        $.each(data_series, function (i, series_name) {
            $.getJSON(series_name, {
                startDate: $('.input-daterange [name=start]').val(),
                endDate: $('.input-daterange [name=end]').val(),
                channels: function () {
                    channelsAdded = []
                    $.each($('#added-channels li'), function(index, added_channel) {
                        channelsAdded.push($(added_channel).attr('data-value'));
                    });
                    return channelsAdded;
                }
            }, function(data) {
                jsonCallsCompleted += kallbak (data, series_name);
                if (jsonCallsCompleted === data_series.length) {
                    if ($('#moodContainer').highcharts())
                        $('#moodContainer').highcharts().destroy();
                    if ($('#countContainer').highcharts())
                        $('#countContainer').highcharts().destroy();
                    createMoodChart();
                    createCountChart();
                    $('#refresh').button('reset');
                }
            });
        });
    }

    updateSeriesAndRedrawChart = function (data, series_name) {
        channel_names = Object.keys(data)

        $.each(channel_names, function(index, channel_name){
            lineStyle = series_name === data_series[1] ? 'shortDot' : 'solid'
            moodSeries.push({
                name: channel_name + "_"+ series_name,
                data: data[channel_name]["mood_data"],
                dashStyle: lineStyle,
                color: series_colors[index]
            })
            if (data[channel_name]["count_data"] && data[channel_name]["count_data"].length > 0) {
                countSeries.push({
                    name: channel_name + "_"+ series_name,
                    data: data[channel_name]["count_data"],
                    color: series_colors[index]
                })
            }
            if (data[channel_name]["message_data"] && Object.keys(data[channel_name]["message_data"]).length > 0) {
                moodMessages[channel_name] = data[channel_name]["message_data"]
            }
        });

        return 1;  
    }

    updateData(updateSeriesAndRedrawChart);

    $('.input-daterange').datepicker({
    });

    $('#refresh').click(function () {
        $(this).button('loading');
        updateData(updateSeriesAndRedrawChart);
    });
});



