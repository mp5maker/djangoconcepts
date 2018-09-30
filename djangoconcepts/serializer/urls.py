from django.conf.urls import url
from serializer.views import EmployeeList

urlpatterns = [
    url(r'^employee/', EmployeeList.as_view(), name="employee_list")
]