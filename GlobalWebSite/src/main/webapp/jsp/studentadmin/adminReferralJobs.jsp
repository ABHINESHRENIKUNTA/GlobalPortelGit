                        <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6 pr-1">
                                                <div class="form-group">
                                                    <label>Job Title</label>
                                                    <form:input type="text" path="jobtitle" class="form-control" placeholder="Job Title" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 px-1">
                                                <div class="form-group">
                                                    <label>Industry</label>
                                                     <form:input type="text" path="industry" class="form-control" placeholder="E.g IT-Software / Software Services"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 pl-1">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Role</label>
                                                   <form:input type="text" path="rolecategory" class="form-control" placeholder="E.g Product Designer"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 pl-1">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Salary</label>
                                                     <form:input path="salary" class="form-control" placeholder="E.g Rs.10,000 - 12,000 P.A"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 pl-1">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">No.of Positions</label>
                                                    <form:input  type="text" path="noofpossitions" class="touchspin1 form-control" placeholder="E.g 2"/>
                                                </div>
                                            </div>
                                        </div>
                                
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Contact Info</label>
                                                    <form:input type="text" path="contactinfo" class="form-control" placeholder="E.g Phone Number=00000-00000, EmailId=xyz@gmail.com, Location=Hyderabad"/>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Job Responsibilities</label>
                                                    <form:textarea path="jobresponsibilities" rows="4" cols="80" class="form-control" placeholder="Responsibilities description" ></form:textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Skill Requirements</label>
                                                     <form:textarea path="skillreq" rows="4" cols="80" class="form-control" placeholder="Skill description" ></form:textarea>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12" style="display: none;">
                                    <div class="form-group">
                                       <label for="uploadimage">Upload Image<span class="text-danger">*</span></label>
                                       <label class="error" for="linkaddress" id="imagepath_error">This field is required.</label>
                                       <input type="file" name="imagepath" id="imagepath" class="btn btn-success fileupload-add form-control"  accept="image/*" onchange="showMyImage(this)" >
                                    </div>
                                 </div>
                                        <div class="clearfix"></div>
                                </div>
