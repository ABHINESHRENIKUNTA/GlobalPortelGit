<thead>
  <tr>
    <th>#</th>
    <th>Link Name</th>
    <th>Created By</th>
    <th>Created Date</th>
    <th>Status</th>
    <th>Actions</th>
  </tr>
</thead>
<tbody>
  <c:forEach items="${alistdata}" var="listdata" varStatus="loop">
    <tr>
      <td>${loop.index+1}</td>
      <td>${listdata.linkname}</td>
      <td>${listdata.addedby}</td>
      <td>
        <fmt:parseDate value="${listdata.addeddate}" pattern="yyyy-MM-dd HH:mm:ss" var="myDate" />
        <fmt:formatDate type="date" value="${myDate}" pattern="dd-MMM-yyyy" />
      </td>
      <td>
        <c:choose>
          <c:when test="${listdata.isactive==true}"> 
          	<span class="badge badge-success arrowed"> Enabled </span> </c:when>
          <c:otherwise> 
          	<span class="badge badge-success danger"> Disabled </span> 
          </c:otherwise>
        </c:choose>
      </td>
      <td>
      <a href="#" class="btn btn-primary a-btn-slide-text">
        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
        <span><strong>View</strong></span>
        </a>
    <a href="#" class="btn btn-primary a-btn-slide-text">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        <span><strong>Edit</strong></span>            
    </a>
                
  </td>
    </tr>
  </c:forEach>
</tbody>