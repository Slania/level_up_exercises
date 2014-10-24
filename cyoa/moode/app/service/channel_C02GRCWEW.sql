type,user,text,ts
message,U024J4UQK,Ehhhhh that indirection is not great.,1410792676.000341
message,U02GDPEU6,"Yeah, they are meaningful. And this is at the very top level of my data_science, which is very SOA.",1410792635.000340
message,U02GDPEU6,"```
    EXECUTE_DEFAULTS = {
      some_klass: Klass,
      another_klass: AnotherKlass,
      other_klass: OtherKlass,
      input_file:   nil
    }
    def self.execute(**EXECUTE_DEFAULTS)
      super
    end
```",1410792614.000339
message,U024J4UQK,Yar,1410792583.000338
message,U024J4UQK,Are the defaults meaningful?,1410792580.000337
message,U02GDPEU6,"I wish something like this would work, in the same way `*array` works:",1410792579.000336
message,U024J4UQK,ParameterObject would be one choice... your input names are pretty decent so I would hate to lose clarity.,1410792554.000335
message,U024J4UQK,Probably you have too many parameters :D,1410792527.000334
message,U02GDPEU6,but this looks funky :disappointed:,1410792468.000333
message,U02GDPEU6,"```
module Foo
  class Bar
    def self.execute(some_klass:  Klass,      another_klass: AnotherKlass,
                     other_klass: OtherKlass, input_file:    nil)
      # some stuff
    end
  end
end
```",1410792457.000332
message,U02GDPEU6,e.g. here's what I'm currently doing:,1410792363.000331
message,U02GDPEU6,<@U024J4UQK>: what's considered good style for named parameter method declarations that run longer than 80 characters?,1410792353.000330
message,U02FRQQFW,verizon on hold music makes me more depressed,1410542996.000329
message,U02FRQQFW,"sure, this afternoon?",1410540664.000328
message,U02F4EX8K,you up for that refactor thing?,1410540587.000327
message,U02F4EX8K,cj,1410540583.000326
message,U024J4UQK,(free something...),1410540529.000325
message,U02FRQQFW,"if you want to sign up for free beer at miller coors HQ next wednesday from 5-6:30 (and still have time to make it to ew gross), registration opens in 15 minutes and will fill up by 12:02-12:03pm <http://us3.campaign-archive2.com/?u=de38d36ce6649b892fa4a2293&amp;id=0fc01413df&amp;e=b744ba111b>",1410540352.000324
message,U02FRQQFW,thanks,1410476328.000323
message,U02F4EX8K,sure,1410476323.000322
message,U02FRQQFW,"perhaps tomorrow can we (if anyone else wants to join in, fine) do a quick 10-30 min code review <@U02F4EX8K>? kinda stuck on this one refactor and probably need a second set of eyes",1410476313.000321
message,U02F4EX8K,absolutely understandable,1410476202.000320
message,U02FRQQFW,"(don't mind me, talking to myself -- i tend to do that a lot) :grinning:",1410476148.000319
message,U02FRQQFW,the joys of refactoring :grinning:,1410476116.000318
message,U02FRQQFW,well this is interestin,1410476105.000317
message,U024J4UQK,),1410464012.000316
message,U024J4UQK,"(btw, if we wanted Neo4j so that we could deduce relationships, we wouldn't actually change the app. We'd ETL into the graph db after the fact.",1410464011.000315
message,U02F4EX8K,eww no.,1410463872.000314
message,U024J4UQK,"If you've got actual SQL-y looking stuff in your controllers, ur doing it wrong.",1410463855.000313
message,U024J4UQK,"The stuff that punches through the abstraction should be in one place, but access itself does happen throughout the app, yes. I don't think repository stops that either.",1410463834.000312
message,U024J4UQK,hehe,1410463797.000311
message,U02F4EX8K,"lol, i thought we threw that out the window a few messages back",1410463778.000310
message,U02F4EX8K,i don't know! i just wanted to talk about the fact that the accesses are scattered through the code instead of being in a single place :stuck_out_tongue:,1410463750.000309
message,U024J4UQK,Speaking then of the idealized world O.o;;,1410463745.000308
message,U02F4EX8K,"because the IRS decided that if we could find relationships between our customers in debt, it would solve the problem of poverty and decided to pay us a few billion dollars for our data transformed into a graph rep for analysis with relationships as first class objects",1410463687.000307
message,U024J4UQK,"also, the data layer itself is still just tables, so the data is surprisingly portable. the business logic is going to be a bitch and a half to port whether you work in Rails, or Node, or any framework whatsoever. Or no framework at all.",1410463605.000306
message,U024J4UQK,...why in the world would we do that...,1410463555.000305
message,U02F4EX8K,"tomorrow for some reason if we decide to migrate to Neo4j, I'd love to see the refactoring effort.",1410463510.000304
message,U024J4UQK,"We manage dependencies, we don't really get rid of them.",1410463475.000303
message,U024J4UQK,I don't mind the dependency if I can just build the damn software.,1410463466.000302
message,U024J4UQK,"I could, but mostly I want to see the implementation of Repository that's half as productive to use as AR :)",1410463455.000301
message,U02F4EX8K,"you could always come back with - omg, C is a hard dependency, omg, OSes are hard dependencies :grinning: but I think it's just what's right below me that I'm most worried about right now.",1410463334.000300
message,U02F4EX8K,(still scares me),1410463206.000299
message,U02F4EX8K,and it scares me. i guess i just need to give it time.,1410463188.000298
message,U02F4EX8K,rails is the biggest @!#ing hard dependency i have seen.,1410463176.000297
message,U02F4EX8K,"```
To put it simply, it is an implementation of a brokering layer between the application and a data source. Neither party needs to be be aware of the other to perform their respective jobs which allows us to have a decoupled architecture which in turn helps in the scaling of the application in the big leagues without having hard dependencies.
```",1410463156.000296
message,U02F4EX8K,it was our own implementation - we wrote the Repository.,1410463110.000295
message,U024J4UQK,Google does not help me. Which repository implementation? Send links.,1410463082.000294
message,U02F4EX8K,but i saw a lot of value,1410463078.000293
message,U02F4EX8K,i will freely admit i could be wildly wrong,1410463074.000292
message,U02F4EX8K,i really liked it,1410463047.000291
message,U02F4EX8K,"when we swapped out ektorp versions, we could test that unit alone easily",1410463022.000290
message,U02F4EX8K,we had ektorp marshalling and unmarshalling in there,1410463001.000289
message,U02F4EX8K,Repo level was merely a wrapper where we hid JS,1410462982.000288
message,U02F4EX8K,Repository + CouchDB,1410462957.000287
message,U024J4UQK,"I mean, as you're describing it, it's vaporware. let's talk about a literal implementation?",1410462941.000286
message,U02F4EX8K,"i dunno, guess i'm just really used to doing it :stuck_out_tongue:",1410462934.000285
message,U02F4EX8K,it's a wrapper.,1410462919.000284
message,U024J4UQK,"Repository is really general, but because of that it's usually a pain in the ass to use.",1410462895.000283
message,U02F4EX8K,i don't care.,1410462880.000282
message,U024J4UQK,That's my point,1410462880.000281
message,U024J4UQK,It doesn't need to be a general purpose solution :),1410462877.000280
message,U02F4EX8K,hide ActiveRecord under a repository,1410462875.000279
message,U02F4EX8K,Repository is a pattern to abstract that concern and provide that modicum of generality,1410462862.000278
message,U02F4EX8K,you see I am saying the same thing as you?,1410462843.000277
message,U02F4EX8K,"i'll admit it's wrong for me to say ""ideal"". i just have a hard time seeing activerecord be a general purpose solution.",1410462834.000276
message,U024J4UQK,"If people like purism, there are frameworks for that. This is a framework for ""these answers are good enough, go worry about more important things""",1410462800.000275
message,U024J4UQK,"I'm not going to claim it's a perfect abstraction, but saying that it's idealized in some way seems silly. We and many others use it to great effect, despite how much we've shunned purism.",1410462773.000274
message,U02F4EX8K,you write Hello World and you've already begun to fuck it up.,1410462728.000273
message,U02F4EX8K,because that's when you have cleanest code.,1410462713.000272
message,U02F4EX8K,it's in fact at it's ultimate best when you have no code,1410462708.000271
message,U02F4EX8K,"joe, ActiveRecord is fun in an ideal world.",1410462697.000270
message,U02F4EX8K,instead of just swapping out the ORM for one that's more suitable,1410462684.000269
message,,,1410462677.000268
message,U024J4UQK,Purists can go do Django.,1410462668.000267
message,U024J4UQK,"I don't want to cater to purists, I want to write software that runs a business :)",1410462658.000266
message,U02F4EX8K,the fact that you had to patch on to an existing framework to cater to purists,1410462642.000265
message,U024J4UQK,Still failing to see the problem (and not seeing any examples where we need to write SQL for transactional data). The article even provides a trivial way to use Mongo in Rails. Where's the problem again?,1410462610.000264
message,U02F4EX8K,lol,1410462435.000263
message,U024J4UQK,speaking of religious flamewars :),1410462415.000262
message,U02F4EX8K,more hacks.,1410462381.000261
message,,,1410462378.000260
message,U02F4EX8K,<http://blog.mongodb.org/post/53271876885/ruby-rails-mongodb-and-the-object-relational-mismatch>,1410462377.000259
message,U02F4EX8K,after hacks.,1410462376.000258
message,U024J4UQK,Name some actual non-trivial transactional queries we need. Keeping in mind that now AR can even do the JSON serialization thing transparently...,1410462282.000257
message,U02F4EX8K,i wish.,1410462250.000256
message,U024J4UQK,select * from table where condition = 'foo'; &lt;-- do not want to write manually.,1410462245.000255
message,U02F4EX8K,i wish.,1410462242.000254
message,U024J4UQK,"Sure, but our select statements are also trivial.",1410462230.000253
message,U024J4UQK,"If 99% of transactional queries are automatable, I want them automated. We can use manual SQL (really we still shouldn't) in the data warehouse where we actually have nontrivial data neds.",1410462221.000252
message,U02F4EX8K,i'll bet $100 that more data is read than written in any successful large scale enterprise.,1410462219.000251
message,U02F4EX8K,nope,1410462195.000250
message,U024J4UQK,Highest volume by several orders of magnitude,1410462182.000249
message,,,1410462169.000248
message,U02F4EX8K,(this is not a Turing argument. do not prove reducibility),1410462154.000247
message,U02F4EX8K,really? you want to argue that single level insert is the highest complexity of SQL statement that a multi million dollar company is going to require.,1410462125.000246
message,U02F4EX8K,"sure, but that's again thinking 37-signals-ly",1410462089.000245
message,U024J4UQK,"In all honesty, I don't want to write SQL at all. I want to write business logic, because that's where the money is. The better my framework does at taking away the need for me to write another insert statement, the better.",1410462046.000244
message,U024J4UQK,"you always have the option to write raw SQL in your AR, you just don't have to most of the time.",1410462008.000243
message,U024J4UQK,except that most of the SQL we write is shit and not necessary...,1410461985.000242
message,U02F4EX8K,it's not - SQL is an art - you can screw with it in so many ways to get desired results.,1410461935.000241
message,U02F4EX8K,it's not just a learning curve thing. it's about the lack of flexibility in writing raw SQL because this assumes that SQL is a strict language.,1410461918.000240
message,U024J4UQK,Even if people have to learn how it works.,1410461853.000239
message,U024J4UQK,"I'll say that every time I've seen repository implemented, it's a huge pain to work with AR is mostly fantastic to work with.",1410461845.000238
message,U024J4UQK,that's true,1410461812.000237
message,,,1410461812.000236
message,U02F4EX8K,"software engineering isn't a science, it's a bunch of egomaniacs yelling and preaching.",1410461803.000235
message,U024J4UQK,Patterns have to be implemented. Then you have a framework.,1410461787.000234
message,U02H6AMNF,<@U02H6AMNF|jmcconnell> has joined the channel,1410461776.000233
message,U02F4EX8K,it's not. it's just not tied to one single implementation. it's a pattern not a framework.,1410461775.000232
message,U024J4UQK,"Also, those things you describe are all in the ActiveRecord framework (which is not really the same as the pattern) :)",1410461763.000231
message,U024J4UQK,"How is that less opinionated as a framework, though? I guess it's a different storage pattern, but I don't see how that'd be an advantage.",1410461744.000230
message,U02F4EX8K,^ aka hiding raw SQL,1410461673.000229
message,U02F4EX8K,_abstractions_ (haha) for queries that were too complex for ActiveRecord to begin with,1410461657.000228
message,U02F4EX8K,decoupling,1410461632.000227
message,U02F4EX8K,uniformity in access irrespective of the ORM framework,1410461626.000226
message,U024J4UQK,What would that gain you?,1410461605.000225
message,U02F4EX8K,coz we're not 37-bloody-signals.,1410461562.000224
message,U02F4EX8K,Repository pattern over ActiveRecord,1410461547.000223
message,U02BATH0T,<@U02BATH0T|sshao> has left the channel,1410461526.000222
message,U024J4UQK,give me an example of the middle ground you would take with respect to rails?,1410461522.000221
message,U02BATH0T,<@U02BATH0T|sshao> has joined the channel,1410461518.000220
message,U02F4EX8K,2) umm I'm simply advocating for a cautious middle ground,1410461484.000219
message,U02F4EX8K,"1) I definitely definitely didn't call it a ""query generation cache"" but I knew it was memoized like most of the other things",1410461437.000218
message,U024J4UQK,"2. eh, seems like a non-issue. you'd have to decide to *never* use convention in that case, because someone might come from elsewhere. rails developers write mostly rails code, and it is consistent with the community's conventions, and that's probably good enough.",1410459923.000217
message,U024J4UQK,"1. Generally, no you don't understand most of your abstractions. If they're relatively consistent, they mostly fade into the background. Did you know there's a query generation cache in Rails' magical finders? You didn't need to.",1410459866.000216
message,U02F4EX8K,"<@U024J4UQK>:  That being said, 2 questions to that end:

1) Do we not need to understand the abstractions? His points seem to be more valid (if I may so phrase it) for people who have either been through the pain of building those abstractions at some point in their life or were actively involved in establishing the abstraction itself
2) Given that programming is a lot more polyglot that than it was a few years back - something like ""Convention over Configuration"" seems to be pushing the boundaries of the definition of what the Rails community itself is. What is your opinion about cross-framework programmers who are trying to keep their _own_ abstractions intact by trying to keep (ironically) the same uniformity that Katz spends about 30minutes stressing upon across frameworks with some that are declarative and some that are magical?",1410457201.000215
message,U02F4EX8K,Katz's talk is pretty cool - I like the points he makes about abstractions and psyche,1410456913.000214
message,U02F4EX8K,"joe I have a question for you - and this might be something that would benefit others, so...",1410456893.000213
message,U02F4EX8K,damn straight,1410453893.000212
message,U02FRQQFW,hunk of code,1410453889.000211
message,U02FRQQFW,LOL,1410453876.000210
message,U02F4EX8K,please do not utter my pretty name in the same breath as that cheap imitation tincan,1410453870.000209
message,U02F4EX8K,yes?,1410453850.000208
message,U02FRQQFW,cnubot siri,1410453844.000207
message,,NoMethodError: undefined method `gov_law_state_cd' for nil:NilClass,1410453833.000206
message,U02F5C5KE,cnubot the laws,1410453832.000205
message,U02F4EX8K,it really really doesn't like me :confused:,1410453815.000204
message,U02F4EX8K,CNUBOT CORE VALUE US,1410453805.000203
message,,"No best answer detected, try again more loudly.",1410453774.000202
message,U024J4UQK,cnubot core value me,1410453774.000201
message,U02F4EX8K,cnubot no like hubot,1410453575.000200
message,U02F4EX8K,cnubot like hubot?,1410453566.000199
message,U02F4EX8K,bahahaha,1410453498.000198
message,,Core Value Detected: Closing Credit Gap,1410453473.000197
message,U024J4UQK,"Oh, cnubot loves core values like operate as an owner",1410453473.000196
message,,"Events:
cnubot apply-patch &lt;patch&gt; - apply patch to cnubot
cnubot blame - who's responsible for this travesty
cnubot cluster - check which cluster cnubot is on
cnubot core value me - select an appropriate core value
cnubot help - Displays all of the help commands that cnubot knows about.
cnubot help &lt;query&gt; - Displays all help commands that match &lt;query&gt;.
cnubot ping - regular ping
cnubot pyong - improved ping
cnubot restart - restart cnubot
cnubot tests - check on test suite status
cnubot the laws - recite the laws",1410453450.000195
message,U02F4EX8K,cnubot help,1410453450.000194
message,U024J4UQK,:),1410453445.000193
message,,NoMethodError: undefined method `help' for nil:NilClass,1410453443.000192
message,U02F4EX8K,cnubot.help,1410453442.000191
message,,NoMethodError: undefined method `responds_to?' for nil:NilClass,1410453398.000190
message,U02F4EX8K,cnubot.responds_to?,1410453397.000189
message,U02FRQQFW,wow 2124... i'm old,1410453373.000188
message,,NoMethodError: undefined method `gov_law_state_cd' for nil:NilClass,1410453365.000187
message,U024J4UQK,cnubot the laws,1410453364.000186
message,U024J4UQK,O.o,1410453361.000185
message,,Current time: 12:30:00 14 June 2124,1410453359.000184
message,U024J4UQK,cnubot tests,1410453358.000183
message,U024J4UQK,cnubot the tests,1410453341.000182
message,,NoMethodError: undefined method `respond_to_edits' for nil:NilClass,1410453332.000181
message,U024J4UQK,cnubot.respond_to_edits(:sri),1410453332.000180
message,U024J4UQK,bots don't see edits,1410453322.000179
message,,,1410453145.000178
message,,,1410453138.000177
message,,,1410453131.000176
message,,,1410453124.000175
message,,,1410453119.000174
message,,,1410453107.000173
message,U02F4EX8K,cnubot.nope,1410453102.000172
message,U024J4UQK,thx.,1410452334.000171
message,,NoMethodError: undefined method `sleep?' for nil:NilClass,1410452333.000170
message,U024J4UQK,cnubot.sleep?,1410452332.000169
message,U02FRQQFW,haha,1410452311.000168
message,U024J4UQK,"damn, cnubot isn't in here? silly me.",1410452304.000167
message,U024J4UQK,cnubot.sleep?,1410452299.000166
message,U02F4EX8K,you need to call that in the context of adam,1410452287.000165
message,U02F4EX8K,silly cj,1410452279.000164
message,U02FRQQFW,sleep(10),1410452267.000163
message,U024J4UQK,I told him to sleep. Make him sleep.,1410452253.000162
message,U02FRQQFW,indeed,1410452239.000161
message,U02F4EX8K,(re: code reviews),1410452209.000160
message,U02F4EX8K,adam's out sick - we can pull him up on hangouts later today,1410452200.000159
message,U02F4EX8K,i'll get on that,1410452097.000158
message,U02F4EX8K,oh shucks,1410452095.000157
message,U024J4UQK,np,1410449029.000156
message,U02FRQQFW,ooh thanks,1410449010.000155
message,,,1410448046.000154
message,U024J4UQK,"for everyone, if you're having sneaky tab issues, I use this to have vim let me know when there are tab chars or trailing spaces:
```
if has('autocmd')
  au filetype ruby set list        "" list chars in ruby
  au filetype ruby set listchars=tab:&gt;-,trail:- "" list trailing spaces + all tabs
endif
```",1410448038.000153
message,U024J4UQK,"otoh, TAAABS <https://github.com/jmmastey/level_up_exercises/pull/41/files>",1410447965.000152
message,U024J4UQK,"<@U02F4EX8K> this dinodex is super clean, fwiw :) yay refactoring!",1410447736.000151
message,U024J4UQK,"get thee to <#C0252CKRH>, fwiw",1410383183.000150
message,U02F4EX8K,clearly i dont have much work :stuck_out_tongue:,1410382694.000149
message,U024J4UQK,O.o,1410382679.000148
message,,_silly bot_,1410382473.000147
message,,_solemn nod_,1410382460.000146
message,U02F4EX8K,sweet.,1410382400.000145
message,U024J4UQK,:themoreyouknow:,1410382380.000144
message,U02F4EX8K,"nevermind, all good",1410382337.000143
message,U02F4EX8K,can one of you post an emoji to the channel please? :grinning:,1410382322.000142
message,,:bowtie:,1410382260.000141
message,U02F4EX8K,"if you already do that, that makes me sad.",1410381703.000140
message,U02F4EX8K,"if you see me posting random messages for the next hour, kindly forgive and ignore me",1410381694.000139
message,U02F5C5KE,done! thanks :),1410366247.000138
message,U02GDPEU6,Merge the above changes into the configs we setup yesterday. `guard-rubocop` works much better than my version using `guard-shell`,1410364731.000137
message,U02GDPEU6,<@U02F5C5KE> *  ^^^,1410364691.000136
message,U02GDPEU6,"@ramya, <@U02FRQQFW>: ```
# Guardfile:
RUBOCOP_OPTS = {
  all_on_start: true,
  cli: ['--format', 'clang', '--rails']
}

RSPEC_OPTS = {
  cmd: 'bundle exec rspec --tty --color',
  notification: true,
  all_on_start: true
}

group :red_green_refactor, halt_on_fail: true do
  guard :rspec, RSPEC_OPTS do
    watch(%r{^lib/(.+)\.rb})      { |m| ""spec/lib/#{m[1]}_spec.rb"" }
    watch(%r{^spec/(.+)\.rb})     { |m| ""#{m[0]}"" }
  end

  guard :rubocop, RUBOCOP_OPTS do
    watch(%r{^(.+)\.rb})
  end
end

# Gemfile:
group :development, :test do
  gem 'coveralls', require: false
  gem 'guard', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-shell', require: false
  gem 'rspec', require: false
  gem 'rubocop', require: false
  gem 'terminal-notifier-guard', require: false
end
```",1410364674.000135
message,U02F5C5KE,<http://rubydoc.info/gems/rspec-expectations/frames>,1410294437.000134
message,,,1410294400.000133
message,U02GDPEU6,<https://relishapp.com/rspec/rspec-mocks/docs>,1410294399.000132
message,,,1410294229.000131
message,U02GDPEU6,<http://betterspecs.org/>,1410294229.000130
message,U02GDPEU6,o.O,1410274907.000129
message,U02FRQQFW,...and the train door shuts as I drop my stuff,1410272460.000128
message,U02F5C5KE,"got it, thanks!",1410271304.000127
message,U02GDPEU6,"Okay, 2pm, kitchen by the big screen. Sent out a gcal invite.",1410270993.000126
message,U02FRQQFW,"works for me
",1410270639.000125
message,U02F5C5KE,how about 2PM?,1410270586.000124
message,U02FRQQFW,commuting right now lol,1410270571.000123
message,U02FRQQFW,afternoon?,1410270551.000122
message,U02GDPEU6,Sure. When are you guys free? We can meet in the kitchen and hijack the big screen if we can find a common time.,1410270537.000121
message,U02F5C5KE,"can i be a part of this discussion too, <@U02FRQQFW> and <@U02GDPEU6> ?",1410270478.000120
message,U02GDPEU6,re: spec practice.,1410270434.000119
message,U02GDPEU6,<@U02FRQQFW>: when are you free this morning?,1410270420.000118
message,U02GDPEU6,"Oh, and, <@U024J4UQK>, thanks for the test praise. That completely slipped by me.",1410270377.000117
message,U024J4UQK,It's actually just a kazoo song. Nothing dirty :),1410265935.000116
message,U02FRQQFW,i'm too scared to click,1410233882.000115
message,U02GDPEU6,"Hah, gotcha. And I fear YouTube links.",1410233838.000114
message,,,1410232903.000113
message,U024J4UQK,"For y'all for good code today, my favorite kazoo song ever: <https://www.youtube.com/watch?v=0CTU8mDmN34> ;)",1410232902.000112
message,U024J4UQK,"Otherwise, it wouldn't exist, heh.",1410231992.000111
message,U024J4UQK,level_up == on Thursday / Friday sometimes I want to play with some specific code.,1410231985.000110
message,U024J4UQK,"I'll probably implement Github-based OAuth soon, and then just let you submit a branch name",1410231931.000109
message,U024J4UQK,"Yeah, I just haven't gotten around to building anything like that :)",1410231912.000108
message,U02GDPEU6,"(or if it tied into github api and watches changes of a repo structured similarly to the modules, exercises, etc.)",1410231543.000107
message,U02GDPEU6,"By the way, <@U024J4UQK>, it'd be really nice if we could submit a gist/github link on completion of level_up tasks :wink:",1410231477.000106
message,U024J4UQK,"Don't impugn my good name, Adam.",1410230852.000105
message,U024J4UQK,never inserts jokes into the things he says,1410230845.000104
message,U02FRQQFW,ok i'll hush and go back to making robot try to work :grinning:,1410230571.000103
message,U02FRQQFW,ISO-9001 :smile:,1410230555.000102
message,U02FRQQFW,it was 800 ish :grinning:,1410230496.000101
message,U02GDPEU6,"And, I see what you did there, <@U024J4UQK>.",1410230486.000100
message,U02FRQQFW,lol,1410230475.000099
message,U02GDPEU6,You got it.,1410230410.000098
message,U024J4UQK,"But yeah, then I can use my bucketeering group to give you code reviews without giving them a 9001 line code review.",1410230399.000097
message,U024J4UQK,"That's easiest for me. Now that you're through ruby, there aren't as many activities so it's not as tough.",1410230380.000096
message,U02GDPEU6,"<@U024J4UQK>, so you want a separate pull for each exercise?",1410230330.000095
message,U02FRQQFW,:grinning:,1410229600.000094
message,U02FRQQFW,*KIDDING*,1410229583.000093
message,U02FRQQFW,goes back to arrowheading,1410229579.000092
message,U02FRQQFW,ok,1410229559.000091
message,U024J4UQK,"also, red -&gt; green -&gt; refactor",1410229540.000090
message,U02GDPEU6,"talk to me tomorrow, <@U02FRQQFW>, I've got a book you can borrow if you want more.",1410229539.000089
message,U02GDPEU6,"write test. test fails. write code. test passes. rinse, wash, repeat.",1410229517.000088
message,U02FRQQFW,"so my understanding of TDD is: you write the expected outcomes of your tests vs. requirements and as your code evolves, eventually you hit the ""Green"" point where they ""pass"" but you also should vary your inputs to the program in the testing so that those scenarios also pass... probably doesn't make sense but... it's out there",1410229434.000087
message,U02GDPEU6,"I try extremely hard to do so, but nobody's perfect. It's the best tool for quickly refactoring things, which is primarily why I like the approach.",1410229352.000086
message,U024J4UQK,"<@U02GDPEU6> do you ""properly"" TDD, as in ""no code that ain't red first""?",1410229301.000085
message,U02FRQQFW,LOL,1410229287.000084
message,U02FRQQFW,i'm sad.,1410229283.000083
message,U024J4UQK,"And it's called ""dignity""",1410229283.000082
message,U024J4UQK,There's a reason that there is no budweiser emoticon.,1410229277.000081
message,U02GDPEU6,"TDD, homes.",1410229265.000080
message,U02FRQQFW,boo they don't have that icon,1410229264.000079
message,U02FRQQFW,:budweiser:,1410229259.000078
message,U02FRQQFW,well first to invent the universe you need Budweiser,1410229256.000077
message,U024J4UQK,"To write a test from scratch, first you must invent the universe?",1410229227.000076
message,U02FRQQFW,lol,1410229193.000075
message,U02FRQQFW,it's a product of my previous environment(s),1410229192.000074
message,U02GDPEU6,sure.,1410229177.000073
message,U02GDPEU6,"hehe, everything is an integration test syndrome. I like that.",1410229171.000072
message,U02FRQQFW,"i suffer from the ""everything is an integration test"" syndrome",1410229046.000071
message,U02FRQQFW,(the ones i've done thus far),1410229011.000070
message,U02FRQQFW,<@U02GDPEU6>: perhaps you can show me how to stub tests to these exercises tomorrow if you have time?,1410229000.000069
message,U02FRQQFW,i'm going to go back to terrorizing people on the metra with my spilled budweiser :grinning:,1410228967.000068
message,U02FRQQFW,welp,1410228937.000067
message,U024J4UQK,wistful sigh,1410228927.000066
message,U024J4UQK,Great tests <@U02GDPEU6>. If our suite were like that...,1410228924.000065
message,,,1410228912.000064
message,U024J4UQK,Second hero for the day: <https://github.com/jmmastey/level_up_exercises/pull/34/files#diff-38>,1410228911.000063
message,U02GDPEU6,It's probably saved me a ton as well.,1410228800.000062
message,U02GDPEU6,Glad you like it ^_^,1410228779.000061
message,,,1410228754.000060
message,U02GDPEU6,<https://github.com/bbatsov/rubocop#automatically-generated-configuration>,1410228754.000059
message,U02FRQQFW,i'm just happy you told us about rubocop... saved me lots of commits,1410228735.000058
message,U02GDPEU6,"there's also an `include` statement for .rubocop.yml, I believe, which you could use to reference .hound.yml from nested exercise folders.",1410228694.000057
message,U02FRQQFW,:grinning:,1410228665.000056
message,U02FRQQFW,"""\n""",1410228664.000055
message,U02FRQQFW,quick! let me arrowhead it,1410228657.000054
message,U02FRQQFW,!,1410228623.000053
message,U024J4UQK,because he's my hero today.,1410224827.000052
message,U024J4UQK,"Also, <@U02H6AMNF> was nice enough to submit a change to the .hound.yml file so that if you do `rubocop -c .hound.yml` it will properly prefer double-quotes to single-quotes.",1410224814.000051
message,U024J4UQK,I am crestfallen. CJ's triangle was perfect but for one change. I thought he was going to be the first perfect score out of the gate.,1410224703.000050
message,U02FRQQFW,"""twiddle wakka"" ... hm.",1410215924.000049
message,U02F4EX8K,i love this app,1410215812.000048
message,U02FRQQFW,ty,1410215677.000047
message,,,1410215501.000046
message,U02GDPEU6,this may also be helpful: <https://blogs.oracle.com/prashant/entry/the_ruby_t_square_operator>,1410215500.000045
message,U02GDPEU6,"or short circuit, iirc.",1410215420.000044
message,U02FRQQFW,ok that's what it's called,1410215331.000043
message,U02GDPEU6,"^ by the way, i like this herokuapp above.",1410215325.000042
message,U02GDPEU6,<http://ruby-operators.herokuapp.com/t-square>,1410215305.000041
message,,,1410215271.000040
message,U02GDPEU6,<http://stackoverflow.com/questions/995593/what-does-or-equals-mean-in-ruby>,1410215270.000039
message,U02GDPEU6,the t-square operator?,1410215269.000038
message,U02FRQQFW,some of the explanations i've found on the net don't *quite* make sense to me,1410214395.000037
message,U02FRQQFW,```||=```,1410214116.000036
message,U02FRQQFW,oops,1410214113.000035
message,U02FRQQFW,where can i find out more about how this particular operator works? ||=,1410214110.000034
message,U02FRQQFW,so for you more experienced folk,1410214099.000033
message,U02FRQQFW,I definitely fixed it :grinning:,1410212291.000032
message,U02FRQQFW,i think i fixed it,1410212285.000031
message,U02FRQQFW,ah ok,1410207396.000030
message,U024J4UQK,Now the only difference from master should be those changes.,1410207236.000029
message,U024J4UQK,"Branch from upstream/master, branch into something new (like styleguide), then cherry-pick your commits into it.",1410207231.000028
message,U024J4UQK,Maybe do cleaner pulls with fewer commits :),1410207200.000027
message,U02FRQQFW,houndci is hounding me for commits i did last month on things not changed in this thing.. how do i get rid of all these extra commits on the branch that are so old and irrelevant?,1410207142.000026
message,U02FRQQFW,"so i made changes to a newly created ""style"" branch and made a pull request",1410207104.000025
message,U02FRQQFW,ugh,1410207085.000024
message,U024J4UQK,Yayyy,1410206857.000023
message,U02F4EX8K,"heads up, she's going to talk to you about me doing it ^_^",1410206468.000022
message,U02F4EX8K,we were talking about how I can write presenters in 8-box to do the same thing but have tests that break when the presenter's/model's return type integrity is breached,1410206456.000021
message,U02F4EX8K,oh yeah I know about that,1410206387.000020
message,U024J4UQK,Yar,1410206381.000019
message,U02F4EX8K,is this Aperture?,1410206366.000018
message,U02F4EX8K,wait,1410206362.000017
message,U02F4EX8K,I don't know about that,1410206360.000016
message,U024J4UQK,"Yeah, it's a nice trick overall. That's what Hettie has been doing with some of the code from Raven.",1410206337.000015
message,U02F4EX8K,"it's sad they have to hack around ActiveRecord's smartness, but loved the json+array_agg trick",1410204015.000014
message,U02F5C5KE,:,1410204010.000013
message,U02F4EX8K,interesting,1410203972.000012
message,,,1410189945.000011
message,U024J4UQK,"Sri, thought this might be in your wheelhouse: <http://reefpoints.dockyard.com/2014/05/27/avoid-rails-when-generating-json-responses-with-postgresql.html> / <https://github.com/dockyard/postgres_ext-serializers>",1410189944.000010
message,U02FRQQFW,"""\n""",1410187948.000009
message,U02GDPEU6,hah,1410186777.000008
message,U024J4UQK,"Or if you're CJ, you just add hard newlines all over the place :D",1410186768.000007
message,U02GDPEU6,"Yep, heh",1410186766.000006
message,U024J4UQK,"Creativity breeds from constraints, right? :)",1410186758.000005
message,U02GDPEU6,"Yes, sadly :disappointed:",1410186752.000004
message,U024J4UQK,"True, but mostly correct.",1410186747.000003
message,U02GDPEU6,Yeah.. 80 column count is annoying.,1410186694.000002
message,U024J4UQK,I ran levelup through Rubocop and empathize with you guys a bit more. Mostly too long lines.,1410133424.000002
message,U02F4EX8K,hell yeah,1410107598.000002
message,U024J4UQK,"scotch at 1:30am, 'eh?",1410104821.000003
message,U02F4EX8K,"really cj? online at 1:33AM? _relax_ bro! turn on some smooth jazz, get yourself some neat scotch, get some strong coffee smell brewing around the house and kick back",1410101175.000002
message,U02FRQQFW,a perfect storm of arrowhead code :grinning:,1409985215.000002
message,U02F4EX8K,a perfect storm?,1409946059.000048
message,U02FRQQFW,"oh great, a storm is headed our way",1409944876.000047
message,U02FRQQFW,microorganisms of sweet refreshing beer,1409944862.000046
message,U024J4UQK,or bacteria.,1409943899.000045
message,U024J4UQK,like cockroaches?,1409943890.000044
message,U02FRQQFW,"where there's life, there's Budweiser ",1409943831.000043
message,U02F5C5KE,okay got one ! `total = a+b+c+d`,1409932585.000042
message,U02F5C5KE,"yeah, im trying to come up with good names for these..",1409932449.000041
message,U02F5C5KE,"```numerator_part1 = (a*d-b*c)**2                                                                                                                                       
numerator_part2 = a+b+c+d                                                                                                                                     
denominator = (a+b)*(c+d)*(b+d)*(a+c)```",1409932432.000040
message,U024J4UQK,"those are problematic names, yeah. It's also a weird calculation, but there should be better names.",1409932413.000039
message,U024J4UQK,delimit with triple-ticks for multi-line code,1409932387.000038
message,U02F5C5KE,"um, trying to reformat this as code.. sorry for the double spam",1409932279.000037
message,U02F5C5KE,"`numerator_part1 = (a*d-b*c)**2                                                                                                                                       
numerator_part2 = a+b+c+d                                                                                                                                     
denominator = (a+b)*(c+d)*(b+d)*(a+c)`",1409932244.000036
message,U02F5C5KE,"i have a naming conundrum.. is there a better way to name the calculation for chi square? i have it like this now - `numerator_part1 = (a*d-b*c)**2                                                                                                                                       
numerator_part2 = a+b+c+d                                                                                                                                     
denominator = (a+b)*(c+d)*(b+d)*(a+c)`",1409932206.000035
message,,,1409862147.000034
message,U02GDPEU6,<https://github.com/nesquena/rabl>,1409862147.000033
message,U02GDPEU6,<http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals>,1409861420.000032
message,,,1409861331.000031
message,U02F4EX8K,<http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html>,1409861331.000030
message,U02GDPEU6,"```
# C: Missing top-level module documentation comment.
Style/Documentation:
  Enabled: false

# C: Prefer reduce over inject.
Style/CollectionMethods:
  Enabled: false

# C: Use each_with_object instead of inject.
Style/EachWithObject:
  Enabled: false
```",1409860001.000029
message,U02GDPEU6,"<@U02FRQQFW>, <@U02F4EX8K>, <@U02F5C5KE> - regarding rubocop:

- install the `rubocop` gem: `gem install rubocop`
- to evaluate your style: `bundle exec rubocop [files]`
  * it's recursive, feel free to include entire directories.
  * default: current work directory
- (optional) create a file in your exercise_root with the name `.rubocop.yml` with this text:
  * from .hound.yml in upstream repo",1409859999.000028
message,U02F5C5KE,CJ and me are in the kitchen - same place where we sat last time,1409857531.000027
message,U02F5C5KE,"damn, i had my preferences changed in slack to notify me for messages in our group alone. apparently, thats not happening",1409853391.000026
message,U02F5C5KE,"great, thanks!",1409853355.000025
message,U02FRQQFW,np,1409853342.000024
message,U02F4EX8K,"and calendar has been updated for future events, sorry about that",1409853252.000023
message,U02F4EX8K,2-3 then,1409853241.000022
message,U02F4EX8K,sweet.,1409853240.000021
message,U02F5C5KE,"2-3 works, im eating :)",1409853235.000020
message,U02F4EX8K,mmhmm,1409853233.000019
message,U02F5C5KE,"sorry. sri, thanks for calling me out. that notified me",1409853224.000018
message,U02F4EX8K,<@U02F5C5KE>: respondez s'il vous plait,1409853181.000017
message,U02FRQQFW,yis,1409853159.000016
message,U02F4EX8K,so she's in at work then,1409853128.000015
message,U02F4EX8K,oh,1409853123.000014
message,U02FRQQFW,she took her laptop somewhere i think,1409853087.000013
message,U02F4EX8K,ramya out?,1409853074.000012
message,U02FRQQFW,2-3 would be good,1409853064.000011
message,U02F4EX8K,i forgot to update the calendar :confused:,1409853062.000010
message,U02F4EX8K,1-2 or 2-3?,1409853053.000009
message,U02FRQQFW,?,1409853051.000008
message,U02F4EX8K,code reviews today yes?,1409853050.000007
message,U02F4EX8K,guise,1409853044.000006
message,U02F4EX8K,guise,1409853043.000005
message,U02GDPEU6,"Nevermind, re: the merge thing. I'm an idiot.",1409845229.000004
message,U02GDPEU6,"Also, <@U024J4UQK>, thanks for the tip regarding bikes. Stopped by the building office and got access this morning. Much appreciated.",1409845106.000003
message,U02GDPEU6,<@U024J4UQK>: format_hash is always empty `{}` and `{ field =&gt; opts[:format] }` never gets merged in.,1409844993.000002
message,U024J4UQK,"```
[4] pry(main)&gt; h.merge!(bar: 2)
=&gt; {:foo=&gt;1, :bar=&gt;2}
[5] pry(main)&gt; h
=&gt; {:foo=&gt;1, :bar=&gt;2}
```",1409781619.000102
message,U02FRQQFW,sweet,1409781619.000101
message,U024J4UQK,"cj, commented on your robots and asked others for arrowhead / triangle",1409781597.000100
message,U024J4UQK,"```
[1] pry(main)&gt; h = { foo: 1 }
=&gt; {:foo=&gt;1}
[2] pry(main)&gt; h.merge(bar: 2)
=&gt; {:foo=&gt;1, :bar=&gt;2}
[3] pry(main)&gt; h
=&gt; {:foo=&gt;1}
```",1409781567.000099
message,U024J4UQK,"`.merge` returns the merged hash but doesn't assign back in, right?",1409781543.000098
message,U02GDPEU6,"```
  def self.formatters(fields)
    fields.inject({}) do |format_hash, (field, opts)|
      if opts.is_a?(Hash)
        format_hash.merge({ field =&gt; opts[:format] })
      end
      format_hash
    end
  end
```",1409781336.000097
message,U02GDPEU6,"anybody have a guess as to why this particular method's inject block doesn't accumulate? `{ field =&gt; opts[:format] }` is valid in debug, but format_hash remains empty, after each iteration and at the end:",1409781332.000096
message,U02F4EX8K,sins is such a powerful word...,1409773923.000095
message,U02FRQQFW,now to circle back and try the custom csv converter idea from sri in dinodex without committing arrowhead sins,1409773703.000094
message,U024J4UQK,I like a review guild... Will do :),1409773657.000093
message,U02FRQQFW,"hey <@U024J4UQK> i just created a pull request with style-related exercises/refactorings, if your review guild could take a look.. (arrowhead/triangle_facts/robot_name)",1409773562.000092
message,U024J4UQK,"Or, y'know, readable :)",1409773080.000091
message,U024J4UQK,"lol, yay magic!",1409773077.000090
message,U02F4EX8K,clearly can't type today,1409772648.000089
message,U02F4EX8K,*suggestion,1409772645.000088
message,U02F4EX8K,keeps things looking rails-y+magick-y,1409772634.000087
message,U02F4EX8K,I think overall it's a good suggestions,1409772618.000086
message,U024J4UQK,"Inlining would be the same level of abstraction (none), but also hard to read. Bad names and consistent abstraction would be confusing.",1409772577.000085
message,U02FRQQFW,ducks,1409772571.000084
message,U02FRQQFW,create_todo_list_item_on_page_1,1409772568.000083
message,U02F4EX8K,*it,1409772542.000082
message,U02F4EX8K,"""t reads nicer, but all it's saying is write like english""",1409772540.000081
message,U024J4UQK,"I agree. And then let's rename all the variables `v1`, `v2`, `v3` etc :)",1409772530.000080
message,U02F4EX8K,"all I'm saying is that if I inlined the methods, it's literally the same piece of code",1409772436.000079
message,U024J4UQK,Or at the least they can be a bit of a code smell (good indication of a need to refactor),1409772388.000078
message,U024J4UQK,"The differing levels of abstraction (in a general sense, not just acceptance tests) do make it harder to read classes.",1409772376.000077
message,U024J4UQK,"I don't think so, the English thing is just a side effect of wanting good method names.",1409772356.000076
message,U02F4EX8K,"it reads nicer, but all it's saying is write like english",1409772138.000075
message,U02F4EX8K,^ <@U024J4UQK>: your acceptance test article,1409772095.000074
message,U02F4EX8K,more like write more levels of indirection,1409772080.000073
message,U024J4UQK,<http://robots.thoughtbot.com/acceptance-tests-at-a-single-level-of-abstraction> found this interesting,1409707272.000072
message,U02F4EX8K,meeting apparently,1409687926.000071
message,U02GDPEU6,so.. what are we doing about this presentation tomorrow?,1409687915.000070
message,U02GDPEU6,^^^,1409687604.000069
message,U02F4EX8K,im still missing the point,1409340828.000068
message,U02F4EX8K,it's  alright,1409340825.000067
message,U02F4EX8K,i did,1409340821.000066
message,U02F5C5KE,"um, didnt you get an invite to check out that presentation?",1409340751.000065
message,U02F4EX8K,why what happened?,1409340724.000064
message,U02F5C5KE,<@U02F4EX8K>:  answering your question on why i set up that meeting. check out the previous new hires presentation,1409340712.000063
message,U02F5C5KE,"haha im not sleepy, just fidgety. have to get to the airport",1409340522.000062
message,U02F5C5KE,like previous group- the tall Dan's one- they had one big ppt with one slide for each person,1409340467.000061
message,U02FRQQFW,togetherrrrr.... togetherrrrrrr.... (sorry was an old karen carpenter song),1409340430.000060
message,U02F4EX8K,"go home ramya, you're sleepy.",1409340423.000059
message,U02F4EX8K,no?,1409340416.000058
message,U02F5C5KE,did i use together twice?,1409340406.000057
message,U02F5C5KE,"well, its not ""prep"" prep. just throw our slides together and make sure its all together :)",1409340396.000056
message,U02F4EX8K,i thought we were just going to wing it,1409340382.000055
message,U02F4EX8K,this a thing now?,1409340376.000054
message,U02F4EX8K,O.O,1409340372.000053
message,U02F5C5KE,i just sent out a meeting request to get together and prep for the tech talk,1409340347.000052
message,U02H6JEG9,<@U02H6JEG9|zsyed> has joined the channel,1409337960.000051
message,U02FRQQFW,pictures: favourite beer .... guess which one mine will be :grinning:,1409337577.000050
message,U024J4UQK,"Eh, the last group used to to have pictures and a few words on who they were.",1409337456.000049
message,U02GDPEU6,"Powerpoint feels like overkill for an introduction, imo. But thanks for the info ^_^",1409336763.000048
message,U024J4UQK,"15 min for all six people, ""presentation"" is generous. have a powerpoint slide or whatever nonetheless, unless you all agree not to I guess.",1409336358.000047
message,U02FRQQFW,i could be mistaken.. i'll ping joe on tuesday,1409334914.000046
message,U02GDPEU6,Presentation? I thought it was just a brief introduction.,1409334884.000045
message,U02FRQQFW,~ 2min per person i overheard,1409334778.000044
message,U02FRQQFW,"nah, we all just need to come up with a presentation.. time's already blocked off",1409334753.000043
message,U02GDPEU6,"Not sure if we need to sign up? I think it was just the cal invite to block off the timeslot, since the timeslot for the tech talks signup is already blocked off for the not an intern stuff.",1409334726.000042
message,U02FRQQFW,probably the signup sheet for tech talks but i think the group was working on a google docs presentation type thingy that we could all edit in realtime,1409334248.000041
message,U02F4EX8K,thought it was an enova wiki page that was editable,1409334215.000040
message,U02FRQQFW,where's the google docs link to the not an intern presentation thingy?,1409334129.000039
message,U02GDPEU6,"Hehe, Joe. Regarding levenshtein, <@U02F4EX8K> asked how I would implement spelling corrections or wildcards in my query grammar for dino_catalog, and provided me with that interesting idea",1409324418.000038
message,U024J4UQK,O.o I cannot even imagine where you're going to use that.,1409261398.000037
message,U02FRQQFW,my head exploded,1409261221.000036
message,U02F4EX8K,for dinos,1409261045.000035
message,U02F4EX8K,fuzzy matching basically,1409261034.000034
message,U02F4EX8K,match abcdefg to a_cde__ where the number of underscores can be parameterized,1409261030.000033
message,U024J4UQK,Interested to know what discussion spawned a link to a levenshtein gem.,1409260992.000032
message,U02F4EX8K,<https://rubygems.org/gems/levenshtein>,1409258027.000031
message,U02GDPEU6,<@U02FRQQFW>: @all_dinosaurs.reject { |dino| dino.matches_any?(criteria) }.each(&amp;method(:puts)),1409255832.000030
message,U02F4EX8K,<http://technicalpickles.com/posts/parsing-csv-with-ruby/>,1409254820.000029
message,,,1409254527.000028
message,U02GDPEU6,<https://github.com/svenfuchs/i18n>,1409254527.000027
message,U02GDPEU6,I'll be there shortly.,1409252246.000026
message,U02FRQQFW,-n,1409249181.000025
message,U02F4EX8K,lets do 2 then,1409249152.000024
message,U02F4EX8K,lol,1409249149.000023
message,U02GDPEU6,"I'm also still eating, so that might be nice.. :grinning:",1409249120.000022
message,U02FRQQFW,but we can do two too because ramyan is still eating,1409249100.000021
message,U02FRQQFW,says 1 on my calendar,1409249084.000020
message,U02F4EX8K,isn't that at 2?,1409248976.000019
message,U02F4EX8K,what now?,1409248974.000018
message,U02FRQQFW,that should have been <@U02F4EX8K>,1409248952.000017
message,U02FRQQFW,sri want to meet in the kitchen thingy?,1409248941.000016
message,,,1409243855.000015
message,U024J4UQK,"Not same but similar, I code to this playlist a lot: <http://open.spotify.com/user/129548977/playlist/78bnvIqNYFiwA91nATPack>",1409243851.000014
message,U02F4EX8K,(Scarlett Johansson helps),1409243502.000013
message,,,1409243475.000012
message,U02F4EX8K,makes for beautiful coding background music: <https://www.youtube.com/watch?v=XUjAtYQkFm8>,1409243474.000011
message,,,1409242517.000010
message,U02F4EX8K,"dino: <https://github.com/Slania/level_up_exercises/tree/master/dino_catalog>
data_science: <https://github.com/Slania/level_up_exercises/tree/master/data_science>",1409242516.000009
message,U02GDPEU6,"although I'm about to make some minor style changes, but overall it shouldn't change that much.",1409236987.000008
message,,,1409236969.000007
message,U02GDPEU6,dino: <https://github.com/aeberlin/level_up_exercises/tree/master/dino_catalog/source>,1409236969.000006
message,U02F5C5KE,but we can go over this today. anyone else up?,1409235441.000005
message,U02F5C5KE,its under revamp from Joe's feedback and i doubt if the latest version will be ready _and_ tested by 1PM,1409232979.000004
message,,,1409232905.000003
message,U02F5C5KE,here are my dinos - <https://github.com/rkannan1/level_up_exercises/tree/master/dino_catalog>,1409232905.000002
message,U02F4EX8K,drop by,1409168903.000019
message,U02F4EX8K,bring it,1409168899.000018
message,U02FRQQFW,:pizza: :pizza: time!,1409168889.000017
message,U024J4UQK,"You're welcome to sign up for a tech talk, though. That page is editable.",1409167956.000016
message,U024J4UQK,"The prior, ""hi my name is, here's cool shit you should know about me""",1409167907.000015
message,U02F4EX8K,"ah, I see",1409167563.000014
message,U02FRQQFW,"i think the one next week is ""hello, i am ___"" not a full blown TT",1409167556.000013
message,U02F4EX8K,sounds good,1409167533.000012
message,U02F4EX8K,"is this meant to be just a ""Hi, My name is _______"" or a ""Go, talk about SOMETHING""?",1409167529.000011
message,U02FRQQFW,<@U02F4EX8K> want to grab pizza at like 2:50 before TT?,1409167521.000010
message,U02FRQQFW,so i could theoretically give a tech talk about a web app i wrote in R and the shiny framework that's still surprisingly running today? :grin:,1409167417.000009
message,U024J4UQK,"Just sent an email, y'all are on the hook for a ""hi I'm not an intern"" presentation, woo! <https://wiki.enova.com/display/DEV/Tech+Talk+Sign+Up+Sheet>",1409166825.000008
message,U02FRQQFW,ditto,1409165377.000007
message,U02F4EX8K,"i dont know if you had lunch already, but i'd be up for pizza break later",1409165211.000006
message,U02F4EX8K,15,1409165189.000005
message,U02FRQQFW,*they,1409158521.000004
message,U02FRQQFW,where'd the stash the pizza,1409158517.000003
message,U02GDPEU6,"By the way, if you're new to ruby, you should probably read this: <http://www.rubyinside.com/what-rubys-double-pipe-or-equals-really-does-5488.html>",1409148397.000002
message,U02FRQQFW,<@U02FRQQFW|cj> set the channel topic: :pizza:,1409106367.000002
message,U02FRQQFW,"```CSV.open(filename, { headers: true, header_converters: :symbol, converters: :all })
```",1409090908.000044
message,U02FRQQFW,i think i found something that works,1409090894.000043
message,U02GDPEU6,"yeah, my problems seem odder than that. blah. tomorrow.",1409089473.000042
message,U02F4EX8K,order matters.,1409089406.000041
message,U02F4EX8K,little bit,1409089398.000040
message,U02GDPEU6,is it just me or are custom converters for CSV extremely finicky?,1409089386.000039
message,U02FRQQFW,wee,1409080742.000038
message,U024J4UQK,(it's not as fun as I make it out to be. they don't swear enough),1409079446.000037
message,U024J4UQK,I used to run that meeting every once in a while. :D,1409079433.000036
message,U02F5C5KE,"lol, you are welcome to join us :grinning:",1409079419.000035
message,U024J4UQK,That sounds exciting,1409079374.000034
message,U02F5C5KE,do you guys want to meet by the elevators now for that culture orientation thingy on 24th?,1409079359.000033
message,U02GDPEU6,"Ah, line of code in 5 seconds. Had a feeling it was something like that.",1409074870.000032
message,U024J4UQK,"Yeah, I did see your match_any, which I mirrored there :)",1409073689.000031
message,U024J4UQK,:D,1409073677.000030
message,U024J4UQK,"I've extracted your various loops into methods and then composed them into each other, so each is easier to read.",1409073676.000029
message,U02FRQQFW,yep.. i got rid of that hideous block last week :grinning:,1409073673.000028
message,U024J4UQK,"```
def find_with_criteria(criteria)
  @dinos.select { |dino| dino.matches_any? criteria }
end

class Dinosaur

  def matches_any?(criteria)
    criteria.any? { |key, value| matches?(key, value) }
  end

  private

  def matches?(key, value)
    # do special case matching where appropriate
    # else just do ==
  end

end
```",1409073635.000027
message,U024J4UQK,"Your variable names are not helping. `row -&gt; dino`, `k, v =&gt; I don't even know`",1409073556.000026
message,U02FRQQFW,it returned me growing a grey hair :grinning:,1409073495.000025
message,U024J4UQK,I think it returns the array of criteria again...,1409073481.000024
message,U024J4UQK,What does that even return?,1409073463.000023
message,U024J4UQK,You've got about five too many indents :),1409073429.000022
message,U024J4UQK,"Yes, all rules broken :)",1409073409.000021
message,U02FRQQFW,"``` def find_with_criteria(criteria)
       criteria.each do | key, value |
           @dinos.select do | row |
               if row[key] == value 
                   values = split_string(row.to_s)
                   values.each do | k, v |
                       k = k.upcase

                       if (criteria.key? find_value_in_key(criteria, ""WEIGHT""))
                           puts ""test""
                           puts ""#{k}: #{v}"" if (row[criteria.fetch(""WEIGHT"")] &gt; criteria.fetch(""WEIGHT""))
                       else
                           puts ""#{k}: #{v}"" if v.length &gt; 1
                       end
                   end
               end
           end
       end
   end
```",1409073271.000020
message,U02FRQQFW,(and just about every other rule),1409073264.000019
message,U02FRQQFW,so this would be a good example of totally breaking the 5 second rule:,1409073255.000018
message,U024J4UQK,"Five second rule: If I cannot understand your line of code in five seconds, it needs to be refactored.",1409073210.000017
message,U024J4UQK,Sri is addicted to splat ;),1409073198.000016
message,U02GDPEU6,"heh, I love splat.",1409071969.000015
message,,,1409071330.000014
message,U02F4EX8K,<http://endofline.wordpress.com/2011/01/21/the-strange-ruby-splat/>,1409071329.000013
message,U02F4EX8K,I am planning on making this my wallpaper - have referred this so many times,1409071329.000012
message,U02GDPEU6,... o.O,1409071227.000011
message,U02FRQQFW,lol,1409070981.000010
message,U02F4EX8K,:grinning:,1409070842.000009
message,U02F4EX8K,you'll come around to it soon enough :0,1409070841.000008
message,U02F4EX8K,yeah,1409070836.000007
message,U02GDPEU6,five second rule?,1409070697.000006
message,U02F4EX8K,"good question, i don't know",1409068519.000005
message,U02F5C5KE,question - where can i find information on five second rule for code review,1409068157.000004
message,U02GDPEU6,I'll drop a few links here around that time.,1409062871.000003
message,U02GDPEU6,"Okay, I should have a better idea where I'm at by the end of day tomorrow.",1409062863.000002
message,U024J4UQK,:),1409005171.000043
message,U024J4UQK,I think that's a great idea :,1409005171.000042
message,U02F5C5KE,i think its a great idea,1409003572.000041
message,U02FRQQFW,"sounds fine, this is my first one _ever_ so i don't know what to expect :grinning:",1409003544.000040
message,U02F4EX8K,that way we have time to process and come up with appreciation/suggestions,1409003486.000039
message,U02F4EX8K,so that we all have time to look at that before we actually get into the review,1409003460.000038
message,U02F4EX8K,lets all tell each other about what each of us is going to be putting under review and provide a link to that,1409003449.000037
message,U02FRQQFW,?,1409003430.000036
message,U02F4EX8K,"guys, I have a suggestion for our code reviews",1409003420.000035
message,U024J4UQK,Linux is fine as-is from what you just sent. Thx for pull too,1409002714.000034
message,U02FRQQFW,"i could break my linux stuff up into separate files, but I did create a pull request for dinos thus far",1409000737.000033
message,U02FRQQFW,hmm,1409000712.000032
message,U024J4UQK,:),1409000619.000031
message,U02F5C5KE,"""gisst.. my prrecious""",1409000607.000030
message,U024J4UQK,"moreso than ""one gist to rule them all and in the darkness bind them""",1409000546.000029
message,U024J4UQK,"at least different ""files"" within a gist",1409000535.000028
message,U024J4UQK,that's not a bad pattern to follow. makes my life easier,1409000526.000027
message,U02F5C5KE,"i have gists for linux stuff, in fact, i think i wrote one for every single exercise :grinning:",1409000157.000026
message,U024J4UQK,not-very-humblebrag?,1409000117.000025
message,U02F4EX8K,tough guy show off,1409000094.000024
message,U024J4UQK,"103 fever, broken ribs. fuck it, it'll heal.",1409000084.000023
message,U02F4EX8K,still show off,1409000081.000022
message,U024J4UQK,"Not that I never get sick, I just never go to the doctor :)",1409000072.000021
message,U024J4UQK,Plz send that on when you can. (and either / both of you please push up your latest dino),1409000062.000020
message,U02F4EX8K,show off. not everyone has immune systems of steel.,1409000059.000019
message,U02FRQQFW,"none for the linux parts, but i think i only have one thing left on that (file descriptors and sockets)",1409000035.000018
message,U024J4UQK,I don't talk to doctors often enough for that to occur :),1408999994.000017
message,U024J4UQK,"<@U02FRQQFW> / <@U02F5C5KE>, did you guys have gists for Linux stuff or any of the ruby?",1408999980.000016
message,U02F4EX8K,tell that to the doc,1408999973.000015
message,U024J4UQK,Gotta be faster.,1408999962.000014
message,U02F4EX8K,there was no pizza when i came back :disappointed:,1408999950.000013
message,U02F5C5KE,np!,1408993462.000012
message,U02FRQQFW,thanks ramya!,1408993411.000011
message,U02F5C5KE,sure,1408992806.000010
message,U02FRQQFW,could i pick someone's brain on a problem i'm having? I'm totally stuck on this issue,1408992774.000009
message,U02FRQQFW,"dunno who, it just appeared out of nowhere haha",1408986719.000008
message,U02GDPEU6,Who do I need to thanks for this sweetness? o.O,1408986493.000007
message,U02GDPEU6,O_O,1408986371.000006
message,U02FRQQFW,for you pizza fanatics there's giordanos in the kitchen,1408986361.000005
message,U02F4EX8K,"though unless you did that explicitly, no reason that should be the case - by default it's configured to spam your desktop and bug the hell out of you",1408981337.000004
message,U02F4EX8K,you might have desktop notifications turned off,1408981304.000003
message,U02GDPEU6,"Oh, hello. Just read through the chat logs and realized there were a bunch of warm welcomes. Slack isn't notifying me when anything is updated in channels, for some reason o.O",1408979480.000002
message,U024J4UQK,"Added Ruby Science to <https://wiki.enova.com/display/DEV/Learning+Resources> for you, if you want to read up on those two code smells.",1408740409.000055
message,U024J4UQK,bow,1408738623.000054
message,U02FRQQFW,"thanks, that points me in the right direction now",1408738504.000053
message,U024J4UQK,(vs. `dino.matches_all?`),1408738026.000052
message,U024J4UQK,"or probably `dino.matches_any?` really, since the and/or semantics might be confusing under that other name",1408738010.000051
message,U024J4UQK,"Also, you may want to look at ""feature envy"". Any reason why dinos shouldn't understand matching? `dino.matches? criteria`",1408737986.000050
message,U024J4UQK,"Look up ""extract method"" as a pattern for more ways to un-arrowhead.",1408737947.000049
message,U02FRQQFW,lol,1408736880.000048
message,U02FRQQFW,crap,1408736880.000047
message,U024J4UQK,:themoreyouknow:,1408736745.000046
message,U02F4EX8K,`i see`,1408736734.000045
message,U024J4UQK,Single ticks for inline,1408736727.000044
message,U024J4UQK,Any more than one layer of indenting in a method and I'm going to bust you for it on code review :),1408736721.000043
message,U02F4EX8K,inline this ```code``` please slack,1408736719.000042
message,U024J4UQK,:),1408736704.000041
message,U02F4EX8K,i like,1408736702.000040
message,U02F4EX8K,```code```,1408736700.000039
message,U024J4UQK,It is better. Use `.select` instead and you can save two layers of arrowheading.,1408736678.000038
message,U024J4UQK,"Use triple-backticks for monospace stuff, plz. Save my old eyes :)",1408736638.000037
message,U02FRQQFW,lol,1408736145.000036
message,U02FRQQFW,"def find_dinosaurs(criteria)

        criteria.each do | key, value |
            @dinos.each do | row |
                if row[key] == value
                    add_dinosaurs_to_collection(row)
                end
            end
        end
        print_valid_dinosaurs()
    end",1408736144.000035
message,U02FRQQFW,ok i think this is a touch better,1408736143.000034
message,U02F5C5KE,enova websites arent a problem. google searches run okay. trying to open a website from that search or any other specific website (like speedtest) is taking a long time,1408733864.000033
message,U02F4EX8K,like google searches?,1408733780.000032
message,U02F4EX8K,can you access websites and stuff normally?,1408733776.000031
message,U02F4EX8K,and I thought a flushdns would help,1408733757.000030
message,U02F4EX8K,sometimes the local DNS caches get corrupted (for no reason),1408733747.000029
message,U02F4EX8K,so your dns resolution isn't screwed up and you have connectivity,1408733733.000028
message,U02F4EX8K,ok,1408733725.000027
message,U02F5C5KE,"PING <http://www.google.com|www.google.com> (74.125.225.114): 56 data bytes
64 bytes from 74.125.225.114: icmp_seq=0 ttl=52 time=1.531 ms
64 bytes from 74.125.225.114: icmp_seq=1 ttl=52 time=2.991 ms",1408733720.000026
message,U02F4EX8K,try google,1408733666.000025
message,U02F5C5KE,the ip,1408733661.000024
message,U02F4EX8K,google or the IP?,1408733656.000023
message,U02F4EX8K,"which one, the first one?",1408733650.000022
message,U02F5C5KE,"64 bytes from 74.125.225.113: icmp_seq=0 ttl=52 time=1.611 ms
64 bytes from 74.125.225.113: icmp_seq=1 ttl=52 time=1.720 ms
64 bytes from 74.125.225.113: icmp_seq=2 ttl=52 time=1.725 ms
64 bytes from 74.125.225.113: icmp_seq=3 ttl=52 time=1.732 ms
64 bytes from 74.125.225.113: icmp_seq=4 ttl=52 time=1.945 ms
64 bytes from 74.125.225.113: icmp_seq=5 ttl=52 time=2.549 ms",1408733623.000021
message,U02F4EX8K,ping 74.125.225.113,1408733602.000020
message,U02F4EX8K,actually wait,1408733573.000019
message,U02F4EX8K,ping <http://www.google.com|www.google.com> from your command line,1408733564.000018
message,,,1408733526.000017
message,U02F5C5KE,<http://www.speedtest.net/> - 8 seconds and still waiting to load,1408733525.000016
message,U02F5C5KE,i see,1408732910.000015
message,U02F4EX8K,seems ok now,1408732905.000014
message,U02F4EX8K,it was spluttery this morning,1408732900.000013
message,U02FRQQFW,mine's been fine,1408732900.000012
message,U02F5C5KE,"btw question - how is the internet for you guys? my browser (chrome as well as firefox) is having a hard time opening links, like the one sri sent above",1408732882.000011
message,U02FRQQFW,perfect arrowhead,1408732699.000010
message,U02F5C5KE,lol,1408732684.000009
message,U02F4EX8K,so much your friend,1408732581.000008
message,U02F4EX8K,srsly,1408732577.000007
message,U02F4EX8K,CSV library bro,1408732576.000006
message,U02F4EX8K,cj,1408732570.000005
message,U02FRQQFW,"def find_with_criteria(criteria)
        criteria.each do | key, value |
            @dinos.select do | row |
                if row[key] == value 
                    values = split_string(row.to_s)
                    values.each do | k, v |
                        k = k.upcase

                        if (criteria.key? find_value_in_key(criteria, ""WEIGHT""))
                            puts ""test""
                            puts ""#{k}: #{v}"" if (row[criteria.fetch(""WEIGHT"")] &gt; criteria.fetch(""WEIGHT""))
                        else
                            puts ""#{k}: #{v}"" if v.length &gt; 1
                        end
                    end
                end
            end
        end
    end",1408732531.000004
message,U02FRQQFW,joe: i think i knocked out the arrowhead exercise in the dino exercise,1408732512.000003
message,U024J4UQK,Definitely leverage the Csv library to the fullest. It will do a ton of work for you.,1408717660.000002
message,U02F4EX8K,"i didn't go split, but i still didn't leverage the power of the CSV library",1408666150.000054
message,U02FRQQFW,"i am guilty of using split(',')",1408665892.000053
message,U02F4EX8K,this might be useful for the dinodex stuff - <http://technicalpickles.com/posts/parsing-csv-with-ruby/>,1408665647.000052
message,U024JHTC7,<@U024JHTC7|srees> has left the channel,1408660995.000051
message,U024J4UQK,You could do it when the navigators do. Monday afternoon.,1408660714.000050
message,U02F5C5KE,"lol, im okay with any day.. except tuesday of course",1408660623.000049
message,U02F4EX8K,you also have to pick the day :grinning:,1408660590.000048
message,U02F5C5KE,do you guys want to do it late noon-ish/early evening-ish?,1408660508.000047
message,U02F4EX8K,because that's when i go down for maintenance,1408660458.000046
message,U02F4EX8K,*tuesday evenings,1408660451.000045
message,U02F4EX8K,I'm good with anything but tuesday,1408660444.000044
message,U02F5C5KE,"right, and that's why i stop by your place now and then Joe",1408660435.000043
message,U02F5C5KE,what time/days did you guys have in mind?,1408660418.000042
message,U024J4UQK,"Still, don't wait super long on code review because you're not proud of the code. I may be able to skip you guys through some of the painful stuff.",1408660393.000041
message,U02F4EX8K,mmhmm,1408660383.000040
message,U02F5C5KE,did i miss it during your pizza break?,1408660378.000039
message,U024J4UQK,"Smart plan, good thinking.",1408660371.000038
message,U02F4EX8K,do you have a preference/restrictions/suggestions?,1408660356.000037
message,U02F4EX8K,between us,1408660348.000036
message,U02F4EX8K,ramya we were trying to come up with a time for code reviews,1408660346.000035
message,U02F4EX8K,oh that's right,1408660336.000034
message,U02F5C5KE,"its going good, im looking to do get a code review. trying to ""DRY"" the code as much",1408660325.000033
message,U02FRQQFW,hahah it'll get better,1408659912.000032
message,U024J4UQK,"C'mon man, gotta represent the Test Engineers out there.",1408659862.000031
message,U024J4UQK,"lol, oh no...",1408659850.000030
message,U02FRQQFW,"according the the style guide, this will be even more hideous then the style guide exercise",1408659840.000029
message,U02F4EX8K,lol,1408659840.000028
message,U024J4UQK,"The best code is code you delete, muahaha.",1408659832.000027
message,U024J4UQK,"Or, hell, pair with other people.",1408659822.000026
message,U02F4EX8K,To love or not to love. That's the question.,1408659820.000025
message,U024J4UQK,"Feel free to ask for help when you're stumped on a problem, this isn't really homework.",1408659817.000024
message,U024J4UQK,Will I love them? Will I? :),1408659797.000023
message,U02FRQQFW,you would love the multiple nested do's,1408659768.000022
message,U02FRQQFW,little stumped on a problem but got some ideas on how to overcome them in the dinosaur catalog,1408659727.000021
message,U02F4EX8K,well hello adam,1408659700.000020
message,U024J4UQK,"Ramya, CJ, how are you guys doing on Ruby?",1408659631.000019
message,U02FRQQFW,"hi Adam, welcome",1408659601.000018
message,U024JHTC7,<@U024JHTC7|srees> has joined the channel,1408659265.000017
message,U025F0UST,<@U025F0UST|bheilman> has left the channel,1408658969.000016
message,U025F0UST,<@U025F0UST|bheilman> has joined the channel,1408658932.000015
message,U02F5C5KE,hi Adam! welcome to the team :grinning:,1408658657.000014
message,U024J4UQK,Really Adam's part of this group too. Ohai Adam :D,1408658640.000013
message,U02GDPEU6,<@U02GDPEU6|aeberlin> has joined the channel,1408658632.000012
message,U02F5C5KE,hi Joe!,1408658597.000011
message,U024J4UQK,ohey team,1408658581.000010
message,U024J4UQK,<@U024J4UQK|joe> has joined the channel,1408658576.000009
message,U025F0YB1,<@U025F0YB1|t-bone> has left the channel,1408657986.000008
message,U025F0YB1,<@U025F0YB1|t-bone> has joined the channel,1408657961.000007
message,U0253ACVC,<@U0253ACVC|khargraves> has left the channel,1408657856.000006
message,U0253ACVC,<@U0253ACVC|khargraves> has joined the channel,1408657850.000005
message,U02F4EX8K,<@U02F4EX8K|sri> has joined the channel,1408657742.000004
message,U02F5C5KE,<@U02F5C5KE|rkannan> has joined the channel,1408657718.000003
message,U02FRQQFW,<@U02FRQQFW|cj> has joined the channel,1408657707.000002
