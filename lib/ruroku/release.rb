module Ruroku
  # Public: Represents the Release resource.
  class Release < NestedBase
    attribute :name, String
    attribute :descr, String
    attribute :user, String
    attribute :commit, String
    attribute :env, Hash
    attribute :addons, Array
    attribute :pstable, Hash
    attribute :created_at, Time

    resource_id :name

    # Public: Rollback to specific release.
    #
    # Examples
    #
    #   release.rollback
    def rollback
      api.post_release app.name, name
    end

    # Public: Get release number.
    def number
      name[1..-1].to_i
    end
  end
end
