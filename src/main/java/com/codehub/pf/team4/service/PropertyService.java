package com.codehub.pf.team4.service;

import com.codehub.pf.team4.forms.PropertyForm;
import com.codehub.pf.team4.models.PropertyModel;
import org.springframework.data.domain.Page;
import java.util.List;
import java.util.Optional;

public interface PropertyService {

    List<PropertyModel>  getAllProperties();

    Page<PropertyModel> getAllPropertiesAsPage(int page);

    Optional<PropertyModel> getPropertyByPropertyId(String propertyID);

    Optional<PropertyModel> getPropertyById(Long id);

    Optional<PropertyModel> addProperty(PropertyForm property) throws Exception;

    Optional<PropertyModel> updateProperty(PropertyForm toBeUpdatedProperty);

    boolean deletePropertyById(Long id);

    Optional<PropertyForm> getPropertyByIdAsForm(Long id);
}
