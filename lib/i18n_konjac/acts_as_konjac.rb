module I18nKonjac
  module ActsAsKonjac
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_konjac(*args)
        include I18nKonjac::ActsAsKonjac::LocalInstanceMethods

        return unless ActiveRecord::Base.connection.data_source_exists? self.to_s.pluralize.underscore

        attrs = self.column_names
        attrs = attrs + args if args.present?

        attrs.each do |attr|
          define_method "#{attr}_by_locale" do
            val = if self.attribute_present?("#{current_prefix}#{attr}")
              self.send("#{current_prefix}#{attr}")
            end

            val.presence || self.send("#{attr}")
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
