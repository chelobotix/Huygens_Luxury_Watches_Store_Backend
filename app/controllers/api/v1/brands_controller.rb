module Api
  module V1
    # Brand Controller
    class BrandsController < ApplicationController
      before_action :set_brand, only: %i[show update destroy]

      # GET /api/v1/brands
      # GET /api/v1/brands.json
      def index
        @brands = ::Brand.all
        details = @brands.map { |brand| details_brand(brand) }

        render(json: { status: 'success', brands: details })
      end

      # GET /api/v1/brands/1
      # GET /api/v1/brands/1.json
      def show; end

      # POST /api/v1/brands
      # POST /api/v1/brands.json
      def create
        @brand = ::Brand.new(brand_params)

        if @brand.save
          render(:show, status: :created, location: @brand)
        else
          render(json: @brand.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /api/v1/brands/1
      # PATCH/PUT /api/v1/brands/1.json
      def update
        if @brand.update(brand_params)
          render(:show, status: :ok, location: @brand)
        else
          render(json: @brand.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /api/v1/brands/1
      # DELETE /api/v1/brands/1.json
      def destroy
        @brand.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_brand
        @brand = ::Brand.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def brand_params
        params.require(:brand).permit(:name, :description, :history, :logo)
      end

      # Json to return as details to brand
      def details_brand(brand)
        {
          id: brand.id,
          name: brand.name,
          description: brand.description,
          history: brand.history,
          logo: brand.logo
        }
      end
    end
  end
end
