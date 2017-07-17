module I18nKonjac
  module ActsAsKonjac
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_konjac(options={})
        include I18nKonjac::ActsAsKonjac::LocalInstanceMethods

        self.column_names.each do |column|
          self.instance_eval do
            define_method "#{column}_by_locale" do
              if self.attribute_present?("#{current_prefix}#{column}")
                val = self.send("#{current_prefix}#{column}")

                # when value is empty.
                val = self.send("#{column}") if val.blank?
              else
                # when column is undefine
                val = self.send("#{column}") if val.blank?
              end

              val
            end
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
