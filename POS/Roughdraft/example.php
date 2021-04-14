<?php


/*
| This snippet of code is the navbar on the left side of the screen
| which allows jumping from one subsystem to another.
*/
<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
    <li class="nav-item">
      <a href="#" class="nav-link active py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
        <svg class="bi" width="24" height="24"><use xlink:href="#home"></use></svg>
      </a>
    </li>
    <li>
      <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Dashboard">
        <svg class="bi" width="24" height="24"><use xlink:href="#speedometer2"></use></svg>
      </a>
    </li>
    <li>
      <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Orders">
        <svg class="bi" width="24" height="24"><use xlink:href="#table"></use></svg>
      </a>
    </li>
    <li>
      <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Products">
        <svg class="bi" width="24" height="24"><use xlink:href="#grid"></use></svg>
      </a>
    </li>
    <li>
      <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
        <svg class="bi" width="24" height="24"><use xlink:href="#people-circle"></use></svg>
      </a>
    </li>
  </ul>


/* 
| This snippet is to form the shape of the page which holds the rest of the snippets.
*/
<div class="row">
  <div class="col-4">Ticket Column</div>
  <div class="col-8">Menu Column</div>
</div>


/* (in Menu Column)
| This snippet of code displays the tabs of menus at the top of the page.
*/
<div class="bd-example">
        <nav>
          <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Burgers</button>
            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Pizzas</button>
            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Sides</button>
            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Beverages</button>            
            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Desserts</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <p>Placeholder content for the tab panel. This one relates to the home tab. Takes you miles high, so high, 'cause she’s got that one international smile. There's a stranger in my bed, there's a pounding in my head. Oh, no. In another life I would make you stay. ‘Cause I, I’m capable of anything. Suiting up for my crowning battle. Used to steal your parents' liquor and climb to the roof. Tone, tan fit and ready, turn it up cause its gettin' heavy. Her love is like a drug. I guess that I forgot I had a choice.</p>
          </div>
          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <p>Placeholder content for the tab panel. This one relates to the profile tab. You got the finest architecture. Passport stamps, she's cosmopolitan. Fine, fresh, fierce, we got it on lock. Never planned that one day I'd be losing you. She eats your heart out. Your kiss is cosmic, every move is magic. I mean the ones, I mean like she's the one. Greetings loved ones let's take a journey. Just own the night like the 4th of July! But you'd rather get wasted.</p>
          </div>
          <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
            <p>Placeholder content for the tab panel. This one relates to the contact tab. Her love is like a drug. All my girls vintage Chanel baby. Got a motel and built a fort out of sheets. 'Cause she's the muse and the artist. (This is how we do) So you wanna play with magic. So just be sure before you give it all to me. I'm walking, I'm walking on air (tonight). Skip the talk, heard it all, time to walk the walk. Catch her if you can. Stinging like a bee I earned my stripes.</p>
          </div>
        </div>
  </div>

/* (in Menu Column)
| This snippet of code makes an organized carddeck of cards for 
| the submenus to display menuitems.
*/
        <div class="card-columns">
            <div class="card">
            <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                <h5 class="card-title">Cheeseburger</h5>
                </div>
            </div>
            <div class="card">
            <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                <h5 class="card-title">Bacon Cheeseburger</h5>
                </div>
            </div>
            <div class="card">
            <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                <h5 class="card-title">Pineapple Burger</h5>
                </div>
            </div>
        </div>


/* (in Ticket Column)
| This snippet is used for the div that contains the Ticket component 
| to allow for a scrollable "receipt" of items ordered.
 */
<div class="overflow-auto">...</div>


/* (in Ticket Column)
| This snippet is for the Ticket component.
| It displays the items ordered and how many of each with a badge.
|
|   ** SIDE NOTE: I added the .list-group-flush class to make the items
|   line up like items on a receipt instead of in a bunch of boxes.
|   If it doesn't work as intended, then get rid of it <3 **
*/
<ul class="list-group list-group-flush">
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Regular BLT
    <span class="badge badge-primary badge-pill">14</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Sweet Tea
    <span class="badge badge-primary badge-pill">2</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Large Fries
    <span class="badge badge-primary badge-pill">1</span>
  </li>
</ul>


/* (in Ticket Column)
| This snippet is for the buttons below the Ticket. One button for 'send' and
| another button beside it for 'pay'. 
*/
<button type="button" class="btn btn-primary btn-lg btn-block">Send</button>
<button type="button" class="btn btn-primary btn-lg btn-block">Pay</button>

?>