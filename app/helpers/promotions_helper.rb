module PromotionsHelper
  def show_promotion_image(promotion)
    if Promotion.count == 1
      image_tag promotion.image
    end
  end
end
