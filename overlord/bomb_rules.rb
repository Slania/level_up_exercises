require_relative 'state_machine'
require 'pry'

module BombRules
  
  def self.can_activate? bomb
    bomb.dormant? && validate_code(bomb.state[:activation_code])
  end

  def self.can_explode? bomb
    bomb.active? && (bomb.state[:retries] <= 0 || (bomb.state[:timer].to_i - (Time.now - bomb.state[:armed_at]) <= 0))
  end

  def self.can_deactivate? bomb
    bomb.blown? || (bomb.name.eql?(StateMachine.active) && validate_code(bomb.state[:deactivation_code]))
  end
  
  def self.validate_code(code)
    !(code =~ /\d{4}/).nil?
  end

end
