# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework.views import APIView
from rest_framework.response import Response

from serializer.models import Employee
from serializer.serializers import EmployeeSerializer

# Create your views here.
class EmployeeList(APIView):
    def get(self, request):
        employee = Employee.objects.all()
        data = EmployeeSerializer(employee, many=True).data
        return Response(data)

