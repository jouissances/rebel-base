# To-do List for rebelbase

To-do:
- [x] Add follow and unfollow feature for clubs-users (join), discussions-users (follow)
- [x] Allow users to create, edit, and delete their own clubs
- [x] Genres to appear as preset options (checkbox / dropdowns / auto-complete)
- [x] Allow users to upload avatar and cover pictures for their club (use [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)) in the edit page — new clubs to use placeholder pictures
- [x] Pictures to resize appropriately
- [x] Set user who created club to be admin by default
- [x] Every club successfully created comes with their preset shelf (current, past, future reads), initially empty
- [x] Users can add books to the upcoming section of shelf
- [x] Add book search functionality
- [x] Club's individual page shows shelf section
- [x] Allow discussion and comments to be added during readings only
- [ ] 

Confirm:
- [ ] Views that should be restricted are restricted
- [x] Models use slugs in URL as much as possible (use [FriendlyId](https://github.com/norman/friendly_id))
- [ ] All appropriate validations are working
- [ ] All flash messages are showing at the right place, at the right time
- [x] Use strong params
- [x] Use nested resources somewhere
- [ ]

Bugs: 
- [x] Sometimes book ISBN queried doesn't match the added book
- [ ]