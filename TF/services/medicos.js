const {newdoctor, createImg} = require ('./../models/profesionales');
const {imgFile} = require('./../utils/fileHandler');

const createDoctor = async(body, file) => {
    try{
        const {insertId : idMedicos} = await newdoctor(body);
        const uid = imgFile(file);
        //console.log(uid)
        const obj = {idMedicos, uid};
        const {insertId : idFile} = await createImg(obj);
        return idFile;
    }
    catch(e){
        console.error(e);
    }
}

module.exports = {createDoctor};