require "action_view"

module FastExcelRails
  class TemplateHandler
    def default_format
      :xlsx
    end

    def call(template, source = nil)
      <<-eos
        # Only build one shared workbook object so partials can take advantage
        # of the same workbook by default.
        root_view = false
        unless @fast_excel_rails_template_workbook
          @fast_excel_rails_template_workbook = FastExcel.open
          root_view = true
        end

        # Define a local "workbook" variable for accessing things inside the
        # template.
        workbook = @fast_excel_rails_template_workbook
        #{source || template.source}

        if root_view
          @fast_excel_rails_template_workbook.read_string
        end
      eos
    end
  end
end
