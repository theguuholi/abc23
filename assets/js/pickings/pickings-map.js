import LocationMap from "./location-map";


const PickingsMap = {
    mounted() {
        this.map = new LocationMap(this.el, [-23.585289979339343, -46.67357717366849], event => {
            
        })
    }
}

export default PickingsMap;