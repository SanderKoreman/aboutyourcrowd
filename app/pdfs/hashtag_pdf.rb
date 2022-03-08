class HashtagPdf < Prawn::Document
  def initialize(my_hashtags)
    super(top_margin: 170)

    @my_hashtags = my_hashtags
    hashtags_info
  end

  def hashtags_info

    text "Hashtags info", size: 30, style: :bold
    header = ["ID", "Name", "Score", "Updated at"]
    table_data = []
    table_data << header
    @my_hashtags.each do |hashtag|
      table_data << [hashtag.id, hashtag.name, hashtag.score, hashtag.created_at.to_s]
    end

    table(table_data) do
      row(0).font_stye = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
    end
  end
end
