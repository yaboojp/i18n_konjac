module I18nKonjac
  module ActsAsKonjac
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_konjac(options={})
        include I18nKonjac::ActsAsKonjac::LocalInstanceMethods

        return unless ActiveRecord::Base.connection.table_exists? self.to_s.pluralize.underscore

        self.column_names.each do |column|
          define_method "#{column}_by_locale" do
            val = if self.attribute_present?("#{current_prefix}#{column}")
              self.send("#{current_prefix}#{column}")
            end

            val.presence || self.send("#{column}")
          end
        end
      end
    end

    module LocalInstanceMethods
      def current_prefix
        I18n.locale==I18n.default_locale ? "" : "#{I18n.locale}_"
      end
    end
  end
end

ActiveRecord::Base.send :include, I18nKonjac::ActsAsKonjac
