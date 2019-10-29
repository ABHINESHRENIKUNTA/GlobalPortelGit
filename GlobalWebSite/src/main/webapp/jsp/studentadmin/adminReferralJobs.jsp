
                        <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6 pr-1">
                                                <div class="form-group">
                                                    <label>Job Title</label><span class="text-danger">*</span>
                                                    <label class="error" for="jobtitle" id="jobtitle_error">This field is required.</label>
                                                    <form:input type="text" path="jobtitle" class="form-control" placeholder="Job Title" maxlength="500"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 px-1">
                                                <div class="form-group">
                                                    <label>Industry</label><span class="text-danger">*</span>
                                                     <label class="error" for="industry" id="industry_error">This field is required.</label>
                                                     <form:select path="industryid" class="form-control">
										                <form:option value="0">Select-Industry</form:option>
										                 <c:forEach items="${industryList}" var="listofindustries">
						                                    <form:option value="${listofindustries.id}" >
						                                    ${listofindustries.indusryname}</form:option>
						                                  </c:forEach>
												 </form:select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 px-1">
                                                <div class="form-group">
                                                    <label>Company</label><span class="text-danger">*</span>
                                                    <label class="error" for="company" id="company_error">This field is required.</label>
                                                     <form:input type="text" path="company" class="form-control" placeholder="E.g WIPRO" maxlength="255"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 px-1">
                                                <div class="form-group">
                                                    <label>Qualification</label><span class="text-danger">*</span>
                                                     <label class="error" for="qualification" id="qualification_error">This field is required.</label>
                                                     <form:input type="text" path="qualification" class="form-control" placeholder="E.g B.Tech" maxlength="255"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 px-1">
                                                <div class="form-group">
                                                    <label>Experience</label><span class="text-danger">*</span>
                                                    <label class="error" for="experience" id="experience_error">This field is required.</label>
                                                     <form:input type="text" path="experience" class="form-control" placeholder="E.g 2 - 5 years" maxlength="45"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 px-1">
                                                <div class="form-group">
                                                    <label>Notice Period</label><span class="text-danger">*</span>
                                                    <label class="error" for="noticeperiod" id="noticeperiod_error">This field is required.</label>
                                                     <form:input type="text" path="noticeperiod" class="form-control" placeholder="E.g 15 days" maxlength="45"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 pl-1">
                                                <div class="form-group">
                                                    <label for="rolecategory">Role / Designation</label><span class="text-danger">*</span>
                                                    <label class="error" for="rolecategory" id="rolecategory_error">This field is required.</label>
                                                   <form:input type="text" path="rolecategory" class="form-control" placeholder="E.g Product Designer"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 pl-1">
                                                <div class="form-group">
                                                    <label for="salary">Salary</label><span class="text-danger">*</span>
                                                    <label class="error" for="salary" id="salary_error">This field is required.</label>
                                                     <form:input path="salary" class="form-control" placeholder="E.g Rs.10,000 - 12,000 P.A"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 pl-1">
                                                <div class="form-group">
                                                    <label for="noofpossitions-lab">No.of Positions</label><span class="text-danger">*</span>
                                                    <label class="error" for="noofpossitions" id="noofpossitions_error">This field is required.</label>
                                                    <form:input  type="number" path="noofpossitions" class="touchspin1 form-control" placeholder="E.g 2" min="0" max="999"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 pl-1">
                                                <div class="form-group">
                                                    <label for="jobtype">Job Type</label><span class="text-danger">*</span>
                                                    <label class="error" for="jobtype" id="jobtype_error">This field is required.</label>
                                                    <form:select path="jobtype" class="form-control">
                                                    <form:option value="0">Select Type</form:option>
                                                    <form:option value="Contractor">Contractor</form:option>
                                                    <form:option value="Full-time">Full-time</form:option>
                                                    <form:option value="Internship">Internship</form:option>
                                                    <form:option value="Part-time">Part-Time</form:option>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                     
                                     
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Email# </label><span class="text-danger">*</span>
                                                    <label class="error" for="emailid" id="emailid_error">This field is required.</label>
                                                    <form:input type="text" path="emailid" class="form-control" placeholder="xyz@gmail.com" maxlength="255"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Contact Number</label><span class="text-danger">*</span>
                                                    <label class="error" for="contactnum" id="contactnum_error">This field is required.</label>
                                                    <form:input  path="contactnum" id="phone" name="phone" type="tel" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Location</label><span class="text-danger">*</span>
                                                    <label class="error" for="location" id="location_error">This field is required.</label>
                                                    <form:input type="text" path="location" class="form-control" placeholder="Hyderabad"/>
                                                </div>
                                            </div>
                                          </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Job Responsibilities</label><span class="text-danger">*</span>
                                                    <label class="error" for="jobresponsibilities" id="jobresponsibilities_error">This field is required.</label>
                                                    <form:textarea path="jobresponsibilities" rows="4" cols="80" class="form-control" placeholder="Responsibilities description" maxlength="7500"></form:textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Skill Requirements</label><span class="text-danger">*</span>
                                                    <label class="error" for="skillreq" id="skillreq_error">This field is required.</label>
                                                     <form:textarea path="skillreq" rows="4" cols="80" class="form-control" placeholder="Skill description" maxlength="7500"></form:textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Other Information</label>
                                                    <label class="error" for="otherinfo" id="otherinfo_error">This field is required.</label>
                                                     <form:textarea path="otherinfo" rows="4" cols="80" class="form-control" placeholder="Other Information"  maxlength="7500"></form:textarea>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="clearfix"></div>
                                </div>
