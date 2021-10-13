import L from "leaflet";

export default class LocationMap{
    constructor(mapDomElement, mainLocation, markerClickedCallback) {
        this.map = L.map(mapDomElement).setView(mainLocation, 13);
        const accessToken = "pk.eyJ1IjoiZWx4cHJvIiwiYSI6ImNrdWxhOHAycTI1ZXYycHQ5ZGowdnJjdTIifQ.y2b2t1oYNpeeF0UzzuwvNg"
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
            attribution: '&copy; <a href="https://elxpro.com">Elxpro</a>',
            maxZoom: 18,
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1,
            accessToken: accessToken
        }).addTo(this.map);
    }
}