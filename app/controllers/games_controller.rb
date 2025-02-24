require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def getLetter
    return ("a".."z").to_a.sample().capitalize
  end

  def new
    @letters = (1..10).to_a.map { |_| getLetter()}
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters].split("")
    @apiCall = JSON.parse(URI.parse("https://dictionary.lewagon.com/#{@answer}").read)
    grid = @letters.dup
    @tmp = @answer.upcase.chars.map { |e| grid.include?(e) ? true : false }
    # raise
    session[:score] = 0 unless session.key?(:score)
    if (@apiCall["found"] && !@tmp.include?(false))
      session[:score] += @answer.length
    end
    # raise
  end
end
