/**
 * Created by tastycarb on 2017/2/22.
 */

(function(){
    var router = require('express').Router(),
        bodyParser = require('body-parser'),
        Promise = require('bluebird'),
        fs = Promise.promisifyAll(require('fs')),
        path = require('path'),
        _ = require('lodash');

    /** 获取模板 */
    router.get('/:templateName',function(req,res){
        fs.readFileAsync(path.join(__dirname,'../../views/frontStage/templates/' + req.params.templateName + '.ejs'))
            .then(function(data){
                res.send(data);
            })
            .catch(function(err){
                res.status.send('获取失败');
            });
    });

    /** 更新模板 */
    router.put('/:templateName',bodyParser.urlencoded({extended:true}),function(req,res){
        if(_.isUndefined(req.body.content)) res.status(400).send('请传入内容');
        else {
            var absolutePath = path.join(__dirname,'../../views/frontStage/templates/' + req.params.templateName + '.ejs');
            fs.accessAsync(absolutePath)
                .then(function(){
                    return fs.writeFileAsync(absolutePath,req.body.content,{flag:'w'});
                })
                .then(function(){
                    req.log.info('模板_修改_成功');
                    res.send('模板更新成功');
                })
                .catch(function(err){
                    req.log.error('模板_修改_失败',{err:err});
                    res.status(400).send('模板更新失败');
                });
        }
    });

    /** 获取预览 */
    router.post('/preview/:templateName',bodyParser.urlencoded({extended:true}),function(req,res){
        if(_.isUndefined(req.body.content)) res.status(400).send('请传入内容');
        else {
            if(req.params.templateName === 'instructions')
                res.render('frontStage/instructions',{
                    isPreview:true,
                    content:req.body.content
                });
            else res.render('frontStage/op_res',{
                isPreview:true,
                content:req.body.content
            });
        }
    });

    module.exports = router;
})();