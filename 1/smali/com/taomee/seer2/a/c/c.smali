.class public Lcom/taomee/seer2/a/c/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/taomee/seer2/a/c/b;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/a/d/b;->v:Ljava/lang/String;

    return-object v0
.end method

.method public a(Lorg/json/JSONObject;)Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lcom/taomee/seer2/a/d/b;->b:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, v0

    :goto_0
    iput-object v1, p0, Lcom/taomee/seer2/a/c/c;->b:Ljava/lang/String;

    sget-object v1, Lcom/taomee/seer2/a/d/b;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :goto_1
    iput-object v0, p0, Lcom/taomee/seer2/a/c/c;->a:Ljava/lang/String;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x5a0

    :goto_2
    iput v0, p0, Lcom/taomee/seer2/a/c/c;->c:I

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_0
    sget-object v1, Lcom/taomee/seer2/a/d/b;->b:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/taomee/seer2/a/d/b;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    sget-object v0, Lcom/taomee/seer2/a/d/b;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_2

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_3
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "url:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/a/c/c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ver:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/a/c/c;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " time:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/taomee/seer2/a/c/c;->c:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
