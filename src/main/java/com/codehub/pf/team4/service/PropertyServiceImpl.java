package com.codehub.pf.team4.service;

import com.codehub.pf.team4.domains.Property;
import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.forms.PropertyForm;
import com.codehub.pf.team4.mappers.PropertyFormMapper;
import com.codehub.pf.team4.mappers.PropertyMapper;
import com.codehub.pf.team4.mappers.UserMapper;
import com.codehub.pf.team4.models.PropertyModel;
import com.codehub.pf.team4.models.UserModel;
import com.codehub.pf.team4.repository.PropertyRepository;
import com.codehub.pf.team4.repository.UserRepository;
import com.codehub.pf.team4.utils.GlobalAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;


@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    private PropertyRepository propertyRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<PropertyModel> getAllProperties() {
        return PropertyMapper.mapToPropertyModelList(propertyRepository.findAll());
    }

    @Override
    public Page<PropertyModel> getAllPropertiesAsPage(int page) {
        Page<Property> propertiesAsPage = propertyRepository.findAll(PageRequest.of(page, GlobalAttributes.PAGE_CONTENT_SIZE));

        if (propertiesAsPage.isEmpty()) return Page.empty(); // if page object is empty with given page return empty page object

        List<PropertyModel> propertiesModel = PropertyMapper.mapToPropertyModelList(propertiesAsPage.getContent());
        return  new PageImpl(propertiesModel, propertiesAsPage.getPageable(), propertiesAsPage.getTotalElements());
    }

    @Override
    public Optional<PropertyModel> getPropertyByPropertyId(String propertyID) {
        return PropertyMapper.mapToPropertyModelOptional(propertyRepository.findByPropertyId(propertyID).orElse(null));
    }

    @Override
    public Optional<PropertyModel> getPropertyById(Long id) {
        return PropertyMapper.mapToPropertyModelOptional(propertyRepository.findById(id).orElse(null));
    }

    @Override
    public Optional<PropertyModel> addProperty(PropertyForm newProperty) {
        Property property = PropertyFormMapper.mapToProperty(newProperty);
        property.setUser(userRepository.findById(property.getUser().getId()).get());
        return PropertyMapper.mapToPropertyModelOptional(propertyRepository.save(property));
    }

    @Override
    public Optional<PropertyModel> updateProperty(PropertyForm toBeUpdatedProperty) {
        Property property = PropertyFormMapper.mapToProperty(toBeUpdatedProperty);
        Property originalProperty = propertyRepository.findById(Long.parseLong(toBeUpdatedProperty.getId())).get();

        if (property.equals(originalProperty)) {
            return PropertyMapper.mapToPropertyModelOptional(property);
        }
        property.setUser(originalProperty.getUser());
        return PropertyMapper.mapToPropertyModelOptional(propertyRepository.save(property));
    }

    @Override
    public boolean deletePropertyById(Long propertyId) {
        if (propertyId == null || getPropertyById(propertyId).isEmpty()) {
            System.out.println("Property not found");
            return false;
        }
        propertyRepository.deleteById(propertyId);
        return true;
    }

    @Override
    public Optional<PropertyForm> getPropertyByIdAsForm(Long id) {
        Optional<Property> property = propertyRepository.findById(id);
        return Optional.ofNullable(PropertyFormMapper.mapToPropertyForm(property.get()));
    }

}
