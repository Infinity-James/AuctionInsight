## Auction Insight

#### User Story
As a Funding Circle investor, I want to be able to use an iOS app to list all
the auctions available in the marketplace.

Then, when I select a particular auction, I want to be able to see the
estimated return amount so that I can decide whether to invest.

### My Approach
#### Networking
I built out the Auction model, AuctionService, and APIClient using test-driven
development. I relied on my numerous past experiences building simple web
service clients and opted for an approach popularised by the folks over at
objc.io. Creating Resource as a generic struct allows for expandability whilst
remaining lightweight and easy to throw together and get working.

#### UI
I have used MVP as the fundamental architecture of the app. I've made use of a 
single wireframe object to handle the navigation between view controllers. The 
UI remains untested due to time.
