class MatchingsController < ApplicationController
  def index
    got_reaction_user_ids = Reaction.where(to_user_id: current_user.id, status: 1).pluck(:from_user_id)
    @match_users = Reaction.where(to_user_id: got_reaction_user_ids, from_user_id: current_user.id, status: 1).map(&:to_user)
  end
end
