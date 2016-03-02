class ArticlesController < ApplicationController
  
  def index
    @articles = Article.page(params[:page]).per(10)
  end

  def show
    
    @article = Article.find(params[:id])
    
    #@comments = Comment.page(params[:page]).per(5) [ok mais pour l'article 2 commence l'affichage
                                                # des comments à partir de la page qui suit celle
                                                # où les comments de l'article 1 ont pris fin
                                                # du coup on se retrouve avec des 1eres pages vides
                                                # pour l'article 2]
    
    @comments = Comment.where(article_id: @article).page(params[:page]).per(5) # tri des comments au niveau du controller
                                                # pour que le show ne gère que l'affichage et surtout
                                                # pour que la pagination des comments fonctionne
    
  end
  
end
