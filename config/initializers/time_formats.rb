Date::DATE_FORMATS[:default] = "%d/%m/%Y"
Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"

Time::DATE_FORMATS[:custom_datetime] = "%d.%m.%Y"

Time::DATE_FORMATS[:month_and_year] = '%B %Y'
Time::DATE_FORMATS[:without_utc] = "%FT%T"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }