class PostArticle < Article

  belongs_to :post, inverse_of: :post_article, required: true, foreign_key: :parent_id

end
