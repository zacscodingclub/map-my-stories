import React, { Component } from "react";
import { render } from "react-dom";
import PropTypes from "prop-types";
import { Map, Marker, Popup, TileLayer } from "react-leaflet";
import L from "leaflet";
delete L.Icon.Default.prototype._getIconUrl;

L.Icon.Default.mergeOptions({
  iconRetinaUrl: require("leaflet/dist/images/marker-icon-2x.png"),
  iconUrl: require("leaflet/dist/images/marker-icon.png"),
  shadowUrl: require("leaflet/dist/images/marker-shadow.png")
});

class Hello extends Component {
  state = {
    name: this.props.name
  };

  handleChange = e => {
    const newState = Object.assign({}, this.state, { name: e.target.value });
    this.setState(newState);
  };

  render() {
    return (
      <div>
        <h1>Hello {this.state.name}</h1>
        <span>Change Name: </span>
        <input type="text" name="name" onChange={this.handleChange} />
      </div>
    );
  }
}

Hello.propTypes = {
  name: PropTypes.string
};

const position = [51.505, -0.09];
const map = (
  <Map center={position} zoom={13}>
    <TileLayer
      url="http://{s}.tile.osm.org/{z}/{x}/{y}.png"
      attribution="&copy; <a href=&quot;http://osm.org/copyright&quot;>OpenStreetMap</a> contributors"
    />
    <Marker position={position}>
      <Popup>
        <span>
          A pretty CSS3 popup.<br />Easily customizable.
        </span>
      </Popup>
    </Marker>
  </Map>
);

document.addEventListener("DOMContentLoaded", () => {
  render(map, document.body.appendChild(document.createElement("div")));
});
