var UserSearch = React.createClass({
  mixins: [React.addons.LinkedStateMixin],

  getInitialState: function() {
    return {
      fname : '',
      lname : '',
      email : ''
    };
  },

  handleSubmit: function(e) {
    e.preventDefault();
    // this.state.fname = React.findDOMNode(this.refs.fname).value.trim();
    // this.state.lname = React.findDOMNode(this.refs.lname).value.trim();
    // this.state.email = React.findDOMNode(this.refs.email).value.trim();
    this.props.handleSearch(this.state);
  },

  render: function() {
    return (
      <form onSubmit={this.handleSubmit}>
        <div className="row">
          <div className="col-lg-3 col-md-3 col-sm-3">
            <input valueLink={this.linkState("fname")} type="text" className="form-control" placeholder="First Name"/>
          </div>
          <div className="col-lg-3 col-md-3 col-sm-3">
            <input valueLink={this.linkState("lname")} type="text" className="form-control" placeholder="Last Name"/>
          </div>
          <div className="col-lg-3 col-md-3 col-sm-3">
            <input valueLink={this.linkState("email")} type="text" className="form-control" placeholder="Email"/>
          </div>
          <div className="col-lg-2 col-md-2 col-sm-2">
            <input type="submit" className="form-control" />
          </div>
          <div className="col-lg-1 col-md-1 col-sm-1">
            <input type="reset" className="form-control" onClick={this.props.handleReset}/>
          </div>
        </div>
      </form>
    );
  }
});
