class ArticlesDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options ={})
    {
      sEcho: params[:sEcho].to_i,   
      iTotalRecords: Article.count, 
      iTotalDisplayRecords: articles.total_count, #kaminari usa esto.
      aaData: data
    }
  end

  private
    def data 
      articles.map do |article|
        [
          article.title,
          article.description,
          if @view.logged_in? && (@view.current_user == article.user || @view.current_user.admin?)
            link_to('Edit', @view.edit_article_path(article), class: "btn btn-xs btn-primary")+" | "+
            link_to('Show', article, class: "btn btn-xs btn-info")+" | "+
            link_to('Delete', article, method: :delete, data: {confirm: "Are you sure? "}, class: "btn btn-xs btn-danger")
          else
            link_to('Show', article, class: "btn btn-xs btn-info")
          end
        ]
      end
    end

    def articles
      @articles ||= fetch_articles
    end

    def fetch_articles
      articles = Article.order("#{sort_column} #{sort_direction}").page(page).per(per_page)
      if params[:sSearch].present?
        articles = articles.where("title like :search or description like :search", search: "%#{params[:sSearch]}%")
      end
      articles
    end

    def page 
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[title description Action]
      columns[params[:iSortCol_0].to_i]
    end
    
    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end

end