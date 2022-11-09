class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    #validates :slug, uniqueness: true
    
    after_create :update_slug

    before_update :assign_slug

    def update_slug
        update_attribute(:slug, assign_slug)
    end

    def create_slug
        # create a slug by combining the primary key id and the title of the article post.
        [id.to_s, title].join("-").parameterize
        
    end

    def to_param
       slug
    end
    

    def self.check_string_for_numbers(string)
        #returns true if string contains only numbers or if it's empty
        string.scan(/\D/).empty?
    end


    # does the slug exist in the database? if so, return article
    # if not: check slug against previous patterns to extract the id
    # sanitize the id, 
    # check if an article matches that id
    # return the article if it exists

    #function for id extraction

    def self.extract_id_from_slug(slug)
       slug_arr = slug.split('-')

       potential_article_id = slug_arr[0]
       # check at this point if the string is comprised of only integers, if it isn't then return broken link/404
       number_check = check_string_for_numbers(potential_article_id)

       if number_check == false
        puts('string is not only numbers')
        return false
       end
       
        #convert to integer, make sure theres no error in case the first part can not be converted to an int.
        potential_article_id = potential_article_id.to_i


       if !potential_article_id.nil?
        return potential_article_id
       end


       
    end

    def self.custom_find_by_articles(slug)
        search_parameter = slug[:slug]
        
        # check the search parameter to see if there is a matching slug within Articles
        slug_check = Article.find_by(slug: search_parameter)
        

        # if not ie slug_check = nil?
        if slug_check.nil?
        
            potential_article_id = extract_id_from_slug(search_parameter)
            
            # check if potential_article_id exists and is an integer > 0
            if (potential_article_id.is_a? Integer) && (potential_article_id > 0)
                
                #check db
                potential_article_id_check = Article.find_by(id: potential_article_id)
                if potential_article_id_check.nil? 
                    puts('no article with this id exists')
                else
                    return potential_article_id_check
                end
            
            else
            # if no id then show 404 not found
            puts('there is no article for this url/slug')
          
            end
        else
            # slug exists, just return the article
            puts("slug exists, show article")
            return slug_check
        end



        ## think about the 'new' use case.

    end



    private
    def assign_slug
        self.slug = create_slug
    end
end


