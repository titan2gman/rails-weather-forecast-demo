# Weather Forecast Demo

## API
1. [ArcGis](https://developers.arcgis.com/)
2. [OpenWeather](https://home.openweathermap.org/api_keys)

## How to run
1. Add API credentials
```sh
$ EDITOR="nano"  bin/rails credentials:edit
```
    arcgis_api_user_id: xxxxxxxxxxx
    arcgis_api_key: xxxxxxxxxxx
    openweather_api_key: xxxxxxxxxxx
2. Install dependencies
```ruby
$ bundle
```
3. Test
```ruby
$ bin/rails test
$ bin/rails test:system
```
4. Run
```ruby
$ bin/rails server
```
