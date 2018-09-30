from django.conf.urls import url
from serializer.views import EmployeeListCreate, EmployeeRetrieveUpdateDestroy

urlpatterns = [
    url(r'^employee/', EmployeeListCreate.as_view(), name="employee_list_create"),
    url(r'^employee/(?P<employee_id>[0-9]+)', EmployeeRetrieveUpdateDestroy.as_view(), name="employee_retrieve_update_destroy")
]