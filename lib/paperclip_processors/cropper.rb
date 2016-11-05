module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      if crop_command
        commands = super
        crop_param_index = commands.find_index('-crop')
        commands[crop_param_index + 1] = crop_command if crop_param_index
        commands
      else
        super
      end
    end
    
    def crop_command
      target = @attachment.instance
      if target.cropping?
        "#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}"
      end
    end
  end
end

