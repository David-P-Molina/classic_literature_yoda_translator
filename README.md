# Classic Literature -> Yoda Translator

Welcome to the Classic Literature -> Yoda Translator (CL->YT)! This is for every person who has read a timeless piece of literature and thought to themselves, "I wonder how Yoda would read this?"
If you would like to translate a piece of written history we ask that you Sign-Up/Login to the database. This application uses the Yoda Translator API found here (https://funtranslations.com/api/yoda) and is subject to rate limitations. Since this is a project the API calls are limited to 60 API calls a day or 5 per hour.  

## Installation

### Clone the repository

```shell
git clone git@github.com:David-P-Molina/classic_literature_yoda_translator.git
cd classic_literature_yoda_translator
```
### Install dependencies
And then execute :

    $ bundle install

### Initialize the database

```shell
rails db:create
rails db:migrate
rails db:seed
```
## Starting The Application
type 
```shell
rails server 
```

In your browser visit http://localhost:3000/

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/David-P-Molina/classic_literature_yoda_translator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://https://github.com/David-P-Molina/classic_literature_yoda_translator/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Classic Literature -> Yoda Translator's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/David-P-Molina/classic_literature_yoda_translator/blob/master/CODE_OF_CONDUCT.md).