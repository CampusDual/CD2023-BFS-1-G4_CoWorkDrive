package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.api.core.service.IColorService;
import com.campusdual.coworkdrive.model.core.dao.CarDao;
import com.campusdual.coworkdrive.model.core.dao.ColorDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service implementation for managing colors.
 */
@Lazy
@Service("ColorService")
public class ColorService implements IColorService {
    @Autowired
    private ColorDao colorDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    /**
     * Retrieves colors based on the provided key map and attribute list.
     *
     * @param keyMap    The key map containing the filter parameters.
     * @param attrList  The list of attributes to retrieve.
     * @return          The resulting EntityResult containing the queried colors.
     */
    @Override
    public EntityResult colorQuery(Map<String, Object> keyMap, List<String> attrList) {
        // Convert the id_color value from String to Integer if necessary
        if (keyMap.get(ColorDao.ATTR_ID_COLOR) instanceof String) {
            keyMap.put(ColorDao.ATTR_ID_COLOR, Integer.parseInt((String) keyMap.get(ColorDao.ATTR_ID_COLOR)));
        }

        return this.daoHelper.query(colorDao, keyMap, attrList);
    }

    /**
     * Inserts a new color based on the provided attribute map.
     *
     * @param attrMap   The attribute map containing the details of the color.
     * @return          The resulting EntityResult containing the inserted color.
     */
    @Override
    public EntityResult colorInsert(Map<String, Object> attrMap) {
        return  this.daoHelper.insert(colorDao, attrMap);
    }

    /**
     * Updates an existing color based on the provided attribute and key maps.
     *
     * @param attrMap   The attribute map containing the updated details of the color.
     * @param keyMap    The key map containing the identifiers of the color to update.
     * @return          The resulting EntityResult containing the updated color.
     */
    @Override
    public EntityResult colorUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(colorDao, attrMap, keyMap);
    }

    /**
     * Deletes a color based on the provided key map.
     *
     * @param keyMap    The key map containing the identifiers of the color to delete.
     * @return          The resulting EntityResult indicating the success of the deletion operation.
     */
    @Override
    public EntityResult colorDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(colorDao, keyMap);
    }
}
