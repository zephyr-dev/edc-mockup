function addTeamMember(){

  tm_count = $("fieldset[role='team_member']").length
  if (tm_count < 3){
    tm_count++;
    $("#team").append("<fieldset role='team_member'><h4>Team Member</h4>")
    .append("<div class='form-group'><label class='col-sm-4 control-label'>Email</label><div class='col-sm-4'><input class='form-control' name='update[tm" + tm_count +"_email]' placeholder='Email'/></div></div>")
    .append("<div class='form-group'><label class='col-sm-4 control-label'>First Name</label><div class='col-sm-4'><input class='form-control' name='update[tm" + tm_count +"_first_name]' placeholder='First Name'/></div></div>")
    .append("<div class='form-group'><label class='col-sm-4 control-label'>Last Name</label><div class='col-sm-4'><input class='form-control' name='update[tm" + tm_count +"_last_name]' placeholder='Last Name'/></div></div>")
    .append("<div class='form-group'><label class='col-sm-4 control-label'>Position</label><div class='col-sm-4'><input class='form-control' name='update[tm" + tm_count +"_position]' placeholder='Position'/></div></div>")

  }


}
