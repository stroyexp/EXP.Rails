module ActiveAdmin
  module Views

    class TableFor

      def column_html(attribute, *args)
        column(attribute, *args) { |model| model[attribute].html_safe }
      end

      def column_bool(attribute, *args)
        column(attribute, *args) { |model| model[attribute] ? '&#10004;'.html_safe : '&#10008;'.html_safe }
      end

      def column_imagic(attribute, *args)
        column(attribute, *args) { |model| imagic_tag model[attribute], *args }
      end
    end


    class AttributesTable

      def row_html(attribute, *args)
        row(attribute, *args) { |model| model[attribute].html_safe }
      end

      def row_bool(attribute, *args)
        row(attribute, *args) { |model| model[attribute] ? '&#10004;'.html_safe : '&#10008;'.html_safe }
      end

      def row_imagic(attribute, *args)
        row(attribute, *args) { |model| imagic_tag model[attribute], *args }
      end

    end


    class IndexAsTableAlter < ActiveAdmin::Views::IndexAsTable

      def self.index_name
        "table_alter"
      end

    end

  end
end
