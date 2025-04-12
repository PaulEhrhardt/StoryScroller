# StoryScroller
An Instagram like story scroller study created manually in 4 hours

#### UI

###### Root
StoryListView displaying content of users
* Visited state of the story is visualized by teal/orange background color

###### Detail
StoriesView showing particular stories
* Possibility to 'like' a story on button click

#### Services

###### ContentProvider
Responsible for loading and delivering paginated content
* loads local JSON with dummy data for StoryFeed of users
* encapsulates all logic for handling next page
* handles content-looping (infinite scrolling)


#### Remote Content

###### AsyncImage
Loading of remote images with placeholder
* [Lorem Picsum](https://picsum.photos/) for quick prototyping

#### Persistence

###### SwiftData
Allows for data persistence during app sessions
* Stores an companion object for saving state of visited and liked values per story
* No use of Bindings etc. just deletes/overwrites whole entries


#### Known Issues
* Overly simplistic approach to as time was a general constraint
* Persistence layer missing an UI update => visited state only after app re-start properly reflected
* Persisted story information should be properly prepared on Domain layer and then handed over to UI
