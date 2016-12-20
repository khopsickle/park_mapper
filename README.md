# Park Mapper

Viking Code School hackathon app for finding parks near you.

Main Features:
  - user sets a zip code location
    - display a list of nearby parks
      - order based on grades/area
        - not everything will match up
      - select the ones you want to show up
      - saveable as a POI Marker
        - contains a key (labelable: home, work, school, etc)
      - display a link to that zip code with park locations

Extra Features
  - select a park
    - select assets to display
    - generate a map of that park with the assets labeled

Implementation:
  - User signs up:
    - username
    - email
    - first name
    - zip code

  - Parks
    - zip code
    - name
    - acreage (convert?)
    - park id
    - evaluation (match data by downcased name/supdist)

      *optional*
    - assets (match by property id)

call api (quarterly?)
store the data
