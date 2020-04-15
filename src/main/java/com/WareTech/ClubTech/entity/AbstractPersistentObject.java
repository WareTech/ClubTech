/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package com.WareTech.ClubTech.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

@MappedSuperclass
abstract public class AbstractPersistentObject
{
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;
	@Version
    protected Long version;
    
    /**
     * 
     */
    public AbstractPersistentObject()
    {
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object object)
    {
        if (object == null)
        {
            return false;
        }
        
        if (!object.getClass().equals(this.getClass()))
        {
            return false;
        }
        
        AbstractPersistentObject abstractPersistentObject = (AbstractPersistentObject) object;
        
        if ((this.getId() == null) && (abstractPersistentObject.getId() != null))
        {
            return false;
        }
        
        if ((this.getId() != null) && (abstractPersistentObject.getId() == null))
        {
            return false;
        }
        
        if ((this.getId() == null) && (abstractPersistentObject.getId() == null))
        {
            return this.hashCode() == abstractPersistentObject.hashCode();
        }
        
        return this.getId().equals(abstractPersistentObject.getId());
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode()
    {
        return super.hashCode();
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    public String toString()
    {
        return new StringBuffer()
            .append("{")
            .append(this.getClass())
            .append(", id=")
            .append(this.getId())
            .append("}")
            .toString();
    }

    /* (non-Javadoc)
     * @see ar.com.WareTech.MarkSRL.common.entities.PersistentObject#getId()
     */
    public Long getId()
    {
        return this.id;
    }

    /* (non-Javadoc)
     * @see ar.com.WareTech.MarkSRL.common.entities.PersistentObject#setId(java.lang.Long)
     */
    public void setId(
            Long id
            )
    {
        this.id = id;
    }

    /* (non-Javadoc)
     * @see ar.com.WareTech.MarkSRL.common.entities.PersistentObject#getVersion()
     */
    public Long getVersion()
    {
        return this.version;
    }

    /* (non-Javadoc)
     * @see ar.com.WareTech.MarkSRL.common.entities.PersistentObject#setVersion(java.lang.Long)
     */
    public void setVersion(
            Long version
            )
    {
        this.version = version;
    }

}
