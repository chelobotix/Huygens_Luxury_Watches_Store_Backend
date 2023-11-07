module Api
  module V1
    class WatchesController < ApplicationController
      before_action :set_watch, only: %i[show update destroy]
      before_action :set_watches, only: %i[index]

      # GET /api/v1/watches
      # GET /api/v1/watches.json
      def index
        details = @watches.map { |watch| details_watch(watch) }

        render(json: { status: 'success', funca: 'pos si', watches: details })
      end

      # GET /api/v1/watches/1
      # GET /api/v1/watches/1.json
      def show; end

      # POST /api/v1/watches
      # POST /api/v1/watches.json
      def create
        @watch = Watch.new(watch_params)

        if @watch.save
          render(:show, status: :created, location: @watch)
        else
          render(json: @watch.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /api/v1/watches/1
      # PATCH/PUT /api/v1/watches/1.json
      def update
        if @watch.update(watch_params)
          render(:show, status: :ok, location: @watch)
        else
          render(json: @watch.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /api/v1/watches/1
      # DELETE /api/v1/watches/1.json
      def destroy
        @watch.destroy
      end

      # Return Genre
      def genre
        Rails.logger.debug(watches.genre_id)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_watch
        @watch = Watch.find(params[:id])
      end

      def set_watches
        @watches = Watch.all
      end

      # Only allow a list of trusted parameters through.
      def watch_params
        params.require(:watch).permit(:name, :brand, :price, :video)
      end

      # Json to return as details to watch
      def details_watch(watch)
        {
          id: watch.id,
          name: watch.name,
          price: watch.price,
          gender: watch.gender.sex,
          brand: watch.brand.name,
          video: watch.video,
          reference: watch.reference,
          collection: watch.collection,
          caseSize: watch.caseSize,
          caseMaterial: watch.caseMaterial,
          movement: watch.movement,
          caliber: watch.caliber,
          powerReserve: watch.powerReserve,
          dateAdded: watch.dateAdded,
          dialColor: watch.dialColor,
          dialMaterial: watch.dialMaterial,
          caseBack: watch.caseBack,
          strapMaterial: watch.strapMaterial,
          strapColor: watch.strapColor,
          buckleType: watch.buckleType,
          specialFeature: watch.specialFeatures,
          thumbnails: watch.thumbnails,
          images: watch.images
        }
      end
    end
  end
end
