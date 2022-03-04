class Article < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true
    validates :slug, uniqueness: true
    
    after_create :update_slug
    before_update :assign_slug

    def update_slug
        update_attribute(:slug, assign_slug)
    end

    def create_slug
        return self.title.parameterize
    end

    def to_param
       slug
    end

    private
    def assign_slug
        self.slug = create_slug
    end
end