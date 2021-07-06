require "action_controller"
require "fast_excel_rails/template_handler"

module FastExcelRails
  class Railtie < Rails::Railtie
    initializer "fast_excel_rails.register" do |app|
      ActiveSupport.on_load(:action_view) do
        ActionView::Template.register_template_handler :fast_excel, FastExcelRails::TemplateHandler.new
      end

      ActiveSupport.on_load(:action_controller) do
        unless Mime::Type.lookup_by_extension(:xlsx)
          Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx
        end

        ActionController::Renderers.add :xlsx do |filename, options|
          unless filename.end_with?(".xlsx")
            filename = "#{filename}.xlsx"
          end

          disposition = options.delete(:disposition) || "attachment"

          options[:layout] = false

          content = render_to_string(options)
          send_data(content, :type => :xlsx, :filename => filename, :disposition => disposition)
        end
      end
    end
  end
end
