class Api::UtilsController < Api::BaseController

    IMAGE_EXE = [".gif", ".jpeg", ".jpg", ".png", ".svg"]

    def upload_image
        
        f = params[:file]

        ext = File.extname(f.original_filename)
        raise 'Not alllowed' unless IMAGE_EXE.include?(ext)

        blob = ActiveStorage::Blob.create_after_upload!(
            io: f,
            filename: f.original_filename,
            content_type: f.content_type
        )

        render json:{link: url_for(blob)}
    end
end