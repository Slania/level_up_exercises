require 'pry'
require_relative 'bomb_rules'

module StateMachine

  STATES = {dormant: "/", active: "/activated", blown: "/boom"}
  STATES.each do |state, path|
    self.define_singleton_method(state) do
      state.to_s
    end
  end

  DEPENDENCY_GRAPH = {dormant => active, active => [blown, dormant], blown => dormant}

  def transitionable?(from_state, to)
    case to
    when StateMachine.dormant
      BombRules.can_deactivate? from_state
    when StateMachine.active
      BombRules.can_activate? from_state
    when StateMachine.blown
      BombRules.can_explode? from_state
    end
  end

  def transition(from_state, to)
    return {message: nil, transitioned: false, redirected: false} if from_state.name.eql? to
    return {message: nil, transitioned: false, redirected: true} unless descendants(from_state).include? to

    pre_transition_from_state = Marshal.load(Marshal.dump(from_state))

    transitioned = transitioned? from_state, to

    transition_notice = transition_notice(pre_transition_from_state, State.new(to), transitioned)
    {message: transition_notice, transitioned: transitioned, redirected: true}
  end

  private

  def transitioned?(from_state, to)
    transitionable = transitionable? from_state, to
    if transitionable
    	perform_transition!(from_state, to)
    else
    	transitionable = from_state.update!.transitionable?
      default_transition!(from_state) if transitionable
    end
    transitionable
  end

  def default_transition!(from_state)
    to = descendants_ready_for_transition(from_state)
    raise StateMachineException, "Multiple transitionable states" if to.size > 1

    perform_transition!(from_state, to.first)
  end

  def perform_transition!(from_state, to)
    unless to.nil? or to.empty?
      from_state.transition_to! State.new(to)
    end
  end

  def descendants_ready_for_transition(from_state)
    (Array(descendants(from_state)).map do |descendant| 
      descendant if transitionable?(from_state, descendant)
    end).compact
  end

  def descendants(from_state)
    DEPENDENCY_GRAPH[from_state.name]
  end
  
  def transition_notice(from_state, to_state, transitioned)
    if from_state.active? && !transitioned
    	"Nope, nope, nope, nope. You have #{from_state.state[:retries] - 1} retries left"
    elsif from_state.active? && to_state.dormant? && transitioned
      "Bomb successfully deactivated"
    else
    	nil
    end
  end

end
