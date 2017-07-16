# I18nKonjac

## Installation & Usage

``` ruby
gem "i18n_konjac"
```

Then run:

``` shell
bundle install
```

#### Run your migrations for the desired models

Run:

``` shell
bin/rails generate migration AddTitleToBlogs title:string ja_title:string fr_title:string
```

and now you have a migration

``` ruby
class AddTitleToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :ja_title, :string
    add_column :blogs, :fr_title, :string
  end
end
```

### Usage

#### In your model:

``` ruby
class Blog < ActiveRecord::Base
  acts_as_kojac

  # ...
end
```

``` ruby
>> I18n.default_locale
# => :en

>> I18n.locale
# => :en
>> blog.title
# => "Support of Ruby 2.1 has ended"
>> blog.title_by_locale
# => "Support of Ruby 2.1 has ended"

>> I18n.locale = :ja
# => :ja
>> blog.title
# => "Support of Ruby 2.1 has ended"
>> blog.title_by_locale
# => "Ruby 2.1 公式サポート終了"


>> I18n.locale = :fr
# => :fr
>> blog.title
# => "Support of Ruby 2.1 has ended"
>> blog.title_by_locale
# => "
Le support de Ruby 2.1 s'est terminé"
```

## License

This gem is released under the MIT license.