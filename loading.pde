// ----------------------------------------------
// loading
// ----------------------------------------------
void loading() {
    // give kers random location
    addItemCords(kersX, kersY, maxKers);

    // If kersen are spawned
    if (kersX.size() == maxKers)
        addItemCords(bananaX, bananaY, maxBanana);
        // add banana cords 
        // for (int i = 0; i < maxBanana; i++) {
        //     bananaX.add((int) random(0, blocksX));
        //     bananaY.add((int) random(0, blocksY));
        // }

    if (bananaX.size() == maxBanana) {}
        addItemCords(chameleonX, chameleonY, chameleonSpanCount());

    // If both loaded go on
    if (bananaX.size() == maxBanana && kersX.size() == maxKers && chameleonX.size() == chameleonSpanCount())
            gamescreen = "starting";   
}

