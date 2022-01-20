package com.codehub.pf.team4.mappers;

import com.codehub.pf.team4.domains.Property;
import com.codehub.pf.team4.models.PropertyModel;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class PropertyMapper {

    public static PropertyModel mapToPropertyModel(Property property){
        if (property == null) return null;

        PropertyModel propertyModel = new PropertyModel();
        propertyModel.setId(property.getId());
        propertyModel.setPropertyId(property.getPropertyId());
        propertyModel.setAddress(property.getAddress());
        propertyModel.setYearOfConstruction(property.getYearOfConstruction());
        propertyModel.setHouseType(property.getHouseType());
        propertyModel.setUserId(property.getUser().getId());
        propertyModel.setUser(property.getUser().getFirstName() +", " + property.getUser().getLastName());
        return propertyModel;
    }

    public static List<PropertyModel> mapToPropertyModelList( List<Property> properties){
        return  properties.stream()
                .map(PropertyMapper::mapToPropertyModel)
                .collect(Collectors.toList());
    }

    public static Optional<PropertyModel> mapToPropertyModelOptional(Property property){
        if (property == null) return Optional.empty();
        return  Optional.of(mapToPropertyModel(property));
    }
}
