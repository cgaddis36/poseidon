module Mutations
  module Reviews
    class CreateReview < ::Mutations::BaseMutation
      argument :title, String, required: true
      argument :comment, String, required: true
      argument :rating, String, required: true
      argument :user_id, String, required: true
      argument :business_service_id, String, required: true

      field :review, Types::ReviewType, null: false
      field :errors, [String], null: false

      def resolve(title:, comment:, rating:, user_id:, business_service_id:)
        review = Review.new(title: title,
                        comment: comment,
                        rating: rating.to_f,
                        user_id: user_id.to_i,
                        business_service_id: business_service_id.to_i
                        )
        sum = 0
        length = 0
        business = Business.find(BusinessService.find(business_service_id).business_id)
        business.business_services.each do |business_service|
          if !business_service.reviews.empty?
            business_service.reviews.each do |business_review|
              sum += business_review.rating
              length += 1
            end
          elsif business_service.reviews.empty? && (business_service.id == business_service_id.to_i)
            sum = review.rating
            length += 1
          end
        end
        average = (sum/length)
        business.update!(average_rating: average)
        business.save
        if review.save
          {
            review: review,
            errors: []
          }
        else
          {
            review: nil,
            errors: review.errors.full_messages
          }
        end
      end
    end
  end
end
