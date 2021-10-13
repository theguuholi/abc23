import LocationMap from "./location-map";


const PickingsMap = {
    mounted() {
        let store = JSON.parse(this.el.dataset.selectedStore)
        let location;
        if (store == undefined) {
            location =  [-23.585289979339343, -46.67357717366849];
        } else {
            location =  [store.lat, store.lng];
        }

        this.map = new LocationMap(this.el, location, event => {
          const store_id = event.target.options.storeId
          this.pushEvent("store-clicked", store_id)
        })

        const stores = JSON.parse(this.el.dataset.storePickingList)
        stores.forEach(store => {
            this.map.addMarker(store)
        })
    }
}

export default PickingsMap;