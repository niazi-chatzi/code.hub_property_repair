package com.codehub.pf.team4.mappers;

import com.codehub.pf.team4.domains.Property;
import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.enums.HouseType;
import com.codehub.pf.team4.forms.PropertyForm;
import org.springframework.stereotype.Component;

@Component
public class PropertyFormMapper {

    public static Property mapToProperty(PropertyForm propertyForm) {
        if (propertyForm == null) return null;
        Property property = new Property();
        property.setPropertyId(propertyForm.getPropertyId());
        property.setAddress(propertyForm.getAddress());
        property.setYearOfConstruction(propertyForm.getYearOfConstruction());
        property.setHouseType(HouseType.valueOf(propertyForm.getHouseType()));
        property.setUser((new User()));

        property.getUser().setId(Long.parseLong(propertyForm.getUserId()));

        if (!propertyForm.getId().isEmpty()) {
            property.setId(Long.parseLong(propertyForm.getId()));
        }
        return property;
    }

    public static PropertyForm mapToPropertyForm(Property property) {
        if (property == null) return null;

        PropertyForm propertyForm = new PropertyForm();
        propertyForm.setPropertyId(property.getPropertyId().toString());
        propertyForm.setAddress(property.getAddress());
        propertyForm.setYearOfConstruction(property.getYearOfConstruction());
        propertyForm.setHouseType(property.getHouseType().toString());
        propertyForm.setUserId(property.getUser().getId().toString());
        propertyForm.setId((property.getId().toString()));

        return propertyForm;
    }
}
